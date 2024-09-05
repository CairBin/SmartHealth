<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="政策编号" prop="code">
        <el-input
          v-model="queryParams.code"
          placeholder="请输入政策编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="政策标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入政策标题"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:policy:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:policy:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:policy:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:policy:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="policyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="政策编号" align="center" prop="code" />
      <el-table-column label="政策标题" align="center" prop="title" />
      <el-table-column label="政策内容" align="center" prop="message" />
      <!-- <el-table-column label="城市ID" align="center" prop="cityId" /> -->
      <el-table-column label="地区" align = "center" prop="cityId">
        <template slot-scope="scope">
          {{ getCityName(scope.row.cityId) }}
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:policy:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:policy:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改医保政策管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="政策编号" prop="code">
          <el-input v-model="form.code" placeholder="请输入政策编号" />
        </el-form-item>
        <el-form-item label="政策标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入政策标题" />
        </el-form-item>
        <el-form-item label="政策内容" prop="message">
          <el-input v-model="form.message" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="城市" prop="cityId">
          <treeselect v-model="form.cityId" :options="cityData" :normalizer="normalizer" placeholder="请选择城市ID" />
        </el-form-item>
        <!-- <el-table :data="chinaList" :row-class-name="rowChinaIndex" @selection-change="handleChinaSelectionChange" ref="china">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="名称" prop="name" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.name" placeholder="请输入名称" />
            </template>
          </el-table-column>
          <el-table-column label="父级ID" prop="parentId" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.parentId" placeholder="请输入父级ID" />
            </template>
          </el-table-column>
        </el-table> -->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listPolicy, getPolicy, delPolicy, addPolicy, updatePolicy } from "@/api/system/policy";
import { listChina, getChina, delChina, addChina, updateChina } from "@/api/system/china";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
export default {
  name: "Policy",
  components: {
    Treeselect
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedChina: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 医保政策管理表格数据
      policyList: [],
      // 城市管理表格数据
      chinaList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        code: null,
        title: null,
        message: null,
        cityId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      cityList:[],
      cityMap: null,
      cityData:[],
    };
  },
  created() {
    this.getList();
    this.getCityData();
  },
  methods: {
    /** 查询医保政策管理列表 */
    getList() {
      this.loading = true;
      listPolicy(this.queryParams).then(response => {
        this.policyList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    //获取城市信息
    getCityData(){
      this.loading = true;
      listChina().then(response => {
        // console.log(response.data);
        // const data = { cityId: 0, name: '顶级节点', children: [] };
        // data.children = this.handleTree(response.data, "cityId", "parentId");
        // this.cityData.push(data);
        this.cityList = response.data;
        this.cityData = this.handleTree(response.data, "cityId", "parentId");
        this.cityMap = new Map(response.data.map(
          obj =>{
            return [obj.cityId, obj.name]
          }
        ));
        this.loading = false;
        // console.log(this.cityMap);
      });
    },
    /** 转换城市管理数据结构 */
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.cityId,
        label: node.name,
        children: node.children
      };
    },
    getCityName(id){
      return this.cityMap.get(id);
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        code: null,
        title: null,
        message: null,
        cityId: null,
        createTime: null,
        updateTime: null
      };
      this.chinaList = [];
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加医保政策管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getPolicy(id).then(response => {
        this.form = response.data;
        this.chinaList = response.data.chinaList;
        this.open = true;
        this.title = "修改医保政策管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.chinaList = this.chinaList;
          if (this.form.id != null) {
            updatePolicy(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPolicy(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除医保政策管理编号为"' + ids + '"的数据项？').then(function() {
        return delPolicy(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
	/** 城市管理序号 */
    rowChinaIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 城市管理添加按钮操作 */
    handleAddChina() {
      let obj = {};
      obj.name = "";
      obj.parentId = "";
      this.chinaList.push(obj);
    },
    /** 城市管理删除按钮操作 */
    handleDeleteChina() {
      if (this.checkedChina.length == 0) {
        this.$modal.msgError("请先选择要删除的城市管理数据");
      } else {
        const chinaList = this.chinaList;
        const checkedChina = this.checkedChina;
        this.chinaList = chinaList.filter(function(item) {
          return checkedChina.indexOf(item.index) == -1
        });
      }
    },
    /** 复选框选中数据 */
    handleChinaSelectionChange(selection) {
      this.checkedChina = selection.map(item => item.index)
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/policy/export', {
        ...this.queryParams
      }, `policy_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
