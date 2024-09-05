# SmartHealth

## 描述

基于[Ruoyi-Vue](https://gitee.com/y_project/RuoYi-Vue)二次开发的慧医管理系统。



## 需求分析

### 项目背景

慧医管理系统旨在提高医院、医师、医药公司和销售地点等多个角色的管理效率。通过整合数据管理和操作平台，实现对各个角色的信息管理和业务操作支持。



### 面向客户

  客户为医院、医药公司、连锁药房集团、医药流通公司、医疗管理公司，以及其他需要一体化医疗管理解决方案的机构。

- **医院和诊所**：希望通过统一的信息管理系统来管理医师、患者、药品以及政策等信息，提升管理效率。
- **医药公司**：需要对各类医药政策、药品信息、销售渠道、城市分销网络等进行高效的管理。
- **药房集团**：对销售地点、药品库存等进行统一管理和优化。
- **医疗管理公司**：负责为医院、医师、药房等提供管理咨询和信息化服务的公司，寻求综合解决方案来提升业务管理能力。

 

最终用户为实际使用慧医管理系统的人群，他们可能是来自不同角色的工作人员，每个角色的用户需求和操作流程各不相同。

- **医院和诊所的管理人员：**需要查看和管理医师信息、排班表、患者信息和数据等。
- **医师和护士：通**过系统查看患者病历、预约信息、填写处方、更新患者病程等。



### 产品范围

慧医管理系统的总体功能涵盖了医院、诊所、医药公司、药房以及相关管理人员所需的核心业务操作。系统通过模块化设计，提供了全面的管理和数据分析功能，确保不同角色的用户能够高效地完成各自的工作任务。这些功能的实现将大大提升医疗行业的信息化水平，提高运营效率和服务质量。






## 实现功能

* 医药公司信息管理
    * 公司政策信息管理
* 用户管理（角色分为医生、患者和管理员，由Ruoyi实现）
    * 用户登陆
    * 权限认证
* 主页数据面板
    * 医师、销售药品、合作企业、销售地点数量展示
    * 医师职称柱状图展示
    * 医院科室饼状图展示
    * 最新医保政策/医药公司政策展示
* 医保政策信息管理
* 必备材料管理
* 药品信息管理
* 城市地点管理


### 医药公司模块

#### 数据库设计

(没有特殊强调时，第一列为表的主键)

* 医药公司政策表(t_company_policy)

| 列名        | 数据类型     | 长度  | 是否为空 | 默认值 | 备注       |
| ----------- | ------------ | ----- | -------- | ------ | :--------- |
| id          | BIGINT(20)   |       | NO       | 1      | 公司政策ID |
| company_id  | BIGINT(20)   |       | YES      |        | 公司ID     |
| title       | VARCHAR(255) | 255   | YES      |        | 政策标题   |
| message     | TEXT         | 65535 |          |        | 政策内容   |
| create_time | DATETIME     |       |          |        | 创建时间   |



* 医药公司信息表(t_company)

| 列名          | 数据类型     | 长度 | 是否为空 | 默认值 | 备注     |
| ------------- | ------------ | ---- | -------- | ------ | -------- |
| company_id    | BIGINT(20)   |      | NO       | 1      | 公司ID   |
| company_name  | VARCHAR(255) | 255  | YES      |        | 公司名   |
| company_phone | VARCHAR(255) | 255  | YES      |        | 公司电话 |
| create_time   | DATETIME     |      |          |        | 创建时间 |
| update_time   | DATETIME     |      |          |        | 更新时间 |



#### 接口设计

```java
/**
* 查询药品公司列表
*/
@PreAuthorize("@ss.hasPermi('system:company:list')")
@GetMapping("/list")
public TableDataInfo list(Company company)
  
  
/**
* 导出药品公司列表
*/
@PreAuthorize("@ss.hasPermi('system:company:export')")
@Log(title = "药品公司", businessType = BusinessType.EXPORT)
@PostMapping("/export")
public void export(HttpServletResponse response, Company company)
  
/**
* 获取药品公司详细信息
*/
@PreAuthorize("@ss.hasPermi('system:company:query')")
@GetMapping(value = "/{companyId}")
public AjaxResult getInfo(@PathVariable("companyId") Long companyId)
  
/**
* 新增药品公司
*/
@PreAuthorize("@ss.hasPermi('system:company:add')")
@Log(title = "药品公司", businessType = BusinessType.INSERT)
@PostMapping
public AjaxResult add(@RequestBody Company company)
  
/**
* 修改药品公司
*/
@PreAuthorize("@ss.hasPermi('system:company:edit')")
@Log(title = "药品公司", businessType = BusinessType.UPDATE)
@PutMapping
public AjaxResult edit(@RequestBody Company company)
  
/**
* 删除药品公司
*/
@PreAuthorize("@ss.hasPermi('system:company:remove')")
@Log(title = "药品公司", businessType = BusinessType.DELETE)
@DeleteMapping("/{companyIds}")
    public AjaxResult remove(@PathVariable Long[] companyIds)
```





### 城市地点模块



#### 数据库设计

* 中国省/市/县数据表(t_china)

| 列名      | 数据类型    | 长度 | 是否为空 | 默认值 | 备注       |
| --------- | ----------- | ---- | -------- | ------ | ---------- |
| id        | BIGINT(20)  |      | NO       | 1      | 省/市/县ID |
| name      | VARCHAR(40) | 40   | YES      |        | 名称       |
| parent_id | BIGINT(20)  |      | YES      |        | 上级ID     |



* 城市地点管理表(t_city)

| 列名        | 数据类型     | 长度 | 是否为空 | 默认值 | 备注     |
| ----------- | ------------ | ---- | -------- | ------ | -------- |
| city_id     | BIGINT(20)   |      | NO       | 1      | 城市ID   |
| city_number | VARCHAR(255) | 255  | YES      |        | 城市编号 |
| create_time | DATETIME     |      |          |        | 创建时间 |
| update_time | DATETIME     |      |          |        | 更新时间 |



* 城市信息详情表(t_region)

| 列名      | 数据类型     | 长度 | 是否为空 | 默认值 | 备注     |
| --------- | ------------ | ---- | -------- | ------ | -------- |
| id        | BIGINT(20)   |      | NO       | 1      | ID       |
| city_code | VARCHAR(255) | 255  | YES      |        | 城市编码 |
| lat       | FLOAT        |      |          |        | 纬度     |
| lng       | FLOAT        |      |          |        | 经度     |
| level     | INT(11)      | 11   |          |        | 区域等级 |
| mer_name  | VARCHAR(100) | 100  |          |        | 组合名称 |





#### 接口设计

TODO





### 医保政策模块



#### 数据库设计



* 医保政策表(t_medical_policy)



| 列名        | 数据类型     | 长度  | 是否为空 | 默认值 | 备注     |
| ----------- | ------------ | ----- | -------- | ------ | -------- |
| id          | BIGINT(20)   |       | NO       | 1      | 政策ID   |
| title       | VARCHAR(255) | 255   | YES      |        | 政策标题 |
| message     | TEXT         | 65535 | YES      |        | 政策内容 |
| city_id     | BIGINT(20)   |       | YES      |        | 城市ID   |
| create_time | DATETIME     |       | YES      |        | 创建时间 |
| update_time | DATETIME     |       | YES      |        | 更新时间 |



#### 接口设计

TODO



### 药品信息模块



#### 数据库设计



* 药品信息表(t_drug)

| 列名        | 数据类型     | 长度  | 是否为空 | 默认值 | 备注        |
| ----------- | ------------ | ----- | -------- | ------ | ----------- |
| drug_id     | BIGINT(20)   |       | NO       | 1      | 药品ID      |
| drug_img    | VARCHAR(255) | 255   | YES      |        | 药品图片URL |
| drug_info   | TEXT         | 65535 | YES      |        | 药品成分    |
| drug_effect | TEXT         | 65535 | YES      |        | 药品功效    |
| drug_name   | VARCHAR(255) | 255   | YES      |        | 药品名称    |
| create_time | DATETIME     |       |          |        | 创建时间    |



* 药店信息表(t_sale)

| 列名        | 数据类型     | 长度 | 是否为空 | 默认值 | 备注     |
| ----------- | ------------ | ---- | -------- | ------ | -------- |
| sale_id     | BIGINT(20)   |      | NO       | 1      | 药店ID   |
| sale_name   | VARCHAR(255) | 255  | YES      |        | 药店名称 |
| sale_phone  | VARCHAR(255) | 255  | YES      |        | 联系电话 |
| create_time | DATETIME     |      | YES      |        | 创建时间 |
| update_time | DATETIME     |      | YES      |        | 更新时间 |



* 药品药店关系表(t_drug_sale)



| 列名    | 数据类型   | 长度 | 是否为空 | 默认值 | 备注   |
| ------- | ---------- | ---- | -------- | ------ | ------ |
| id      | BIGINT(20) |      | NO       | 1      | 主键ID |
| sale_id | BIGINT(20) |      | YES      |        | 商店ID |
| drug_id | BIGINT(20) |      | YES      |        | 药品ID |



#### 接口设计

* 药品接口

```java
/**
* 查询药物信息列表
*/
@PreAuthorize("@ss.hasPermi('system:drug:list')")
@GetMapping("/list")
public TableDataInfo list(Drug drug)
  
  
/**
* 导出药物信息列表
*/
@PreAuthorize("@ss.hasPermi('system:drug:export')")
@Log(title = "药物信息", businessType = BusinessType.EXPORT)
@PostMapping("/export")
public void export(HttpServletResponse response, Drug drug)
  
/**
* 获取药物信息详细信息
*/
@PreAuthorize("@ss.hasPermi('system:drug:query')")
@GetMapping(value = "/{drugId}")
public AjaxResult getInfo(@PathVariable("drugId") Long drugId)
  
/**
* 新增药物信息
*/
@PreAuthorize("@ss.hasPermi('system:drug:add')")
@Log(title = "药物信息", businessType = BusinessType.INSERT)
@PostMapping
public AjaxResult add(@RequestBody Drug drug)
  
  
/**
* 修改药物信息
*/
@PreAuthorize("@ss.hasPermi('system:drug:edit')")
@Log(title = "药物信息", businessType = BusinessType.UPDATE)
@PutMapping
public AjaxResult edit(@RequestBody Drug drug)
  
/**
* 删除药物信息
*/
@PreAuthorize("@ss.hasPermi('system:drug:remove')")
@Log(title = "药物信息", businessType = BusinessType.DELETE)
@DeleteMapping("/{drugIds}")
public AjaxResult remove(@PathVariable Long[] drugIds)
```



* 药店接口设计



```java
/**
* 查询商店信息列表
*/
@PreAuthorize("@ss.hasPermi('system:sale:list')")
@GetMapping("/list")
public TableDataInfo list(Sale sale)
      
/**
* 导出商店信息列表
*/
@PreAuthorize("@ss.hasPermi('system:sale:export')")
@Log(title = "商店信息", businessType = BusinessType.EXPORT)
@PostMapping("/export")
public void export(HttpServletResponse response, Sale sale)
      
/**
* 获取商店信息详细信息
*/
@PreAuthorize("@ss.hasPermi('system:sale:query')")
@GetMapping(value = "/{saleId}")
public AjaxResult getInfo(@PathVariable("saleId") Long saleId)
      
/**
* 新增商店信息
*/
@PreAuthorize("@ss.hasPermi('system:sale:add')")
@Log(title = "商店信息", businessType = BusinessType.INSERT)
@PostMapping
public AjaxResult add(@RequestBody Sale sale)
  
  
/**
* 修改商店信息
*/
@PreAuthorize("@ss.hasPermi('system:sale:edit')")
@Log(title = "商店信息", businessType = BusinessType.UPDATE)
@PutMapping
public AjaxResult edit(@RequestBody Sale sale)
      
/**
* 删除商店信息
*/
@PreAuthorize("@ss.hasPermi('system:sale:remove')")
@Log(title = "商店信息", businessType = BusinessType.DELETE)
@DeleteMapping("/{saleIds}")
public AjaxResult remove(@PathVariable Long[] saleIds)
```







### 必备材料模块

#### 数据库设计



* 必备材料信息表(t_material)



| 列名        | 数据类型     | 长度 | 是否为空 | 默认值 | 备注     |
| ----------- | ------------ | ---- | -------- | ------ | -------- |
| id          | BIGINT(11)   |      | NO       | 1      | 编号     |
| title       | VARCHAR(255) | 255  | YES      |        | 材料标题 |
| message     | TEXT         |      | YES      |        | 材料信息 |
| create_time | DATETIME     |      | YES      |        | 创建时间 |
| update_time | DATETIME     |      | YES      |        | 更新时间 |





#### 接口设计



```java
/**
 * 查询必备材料列表
*/
@PreAuthorize("@ss.hasPermi('system:material:list')")
@GetMapping("/list")
public TableDataInfo list(Material material)

/**
 * 导出必备材料列表
*/
@PreAuthorize("@ss.hasPermi('system:material:export')")
@Log(title = "必备材料", businessType = BusinessType.EXPORT)
@PostMapping("/export")
public void export(HttpServletResponse response, Material material)
  
/**
* 获取必备材料详细信息
*/
@PreAuthorize("@ss.hasPermi('system:material:query')")
@GetMapping(value = "/{id}")
public AjaxResult getInfo(@PathVariable("id") Long id)
  
/**
* 新增必备材料
*/
@PreAuthorize("@ss.hasPermi('system:material:add')")
@Log(title = "必备材料", businessType = BusinessType.INSERT)
@PostMapping
public AjaxResult add(@RequestBody Material material)
  
/**
* 修改必备材料
*/
@PreAuthorize("@ss.hasPermi('system:material:edit')")
@Log(title = "必备材料", businessType = BusinessType.UPDATE)
@PutMapping
public AjaxResult edit(@RequestBody Material material)
  
/**
* 删除必备材料
*/
@PreAuthorize("@ss.hasPermi('system:material:remove')")
@Log(title = "必备材料", businessType = BusinessType.DELETE)
@DeleteMapping("/{ids}")
public AjaxResult remove(@PathVariable Long[] ids)
```





## 运行部署

### 搭建环境

* JDK >= 1.8
* MYSQL >= 5.7
* Maven >= 3.0



### 开发环境

以MacOS为例。

首先需要修改`./ruoyi-admin/src/resources/logback.yml`的日志存放路径



```xml
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <!-- 日志存放路径 -->
	<property name="log.path" value="/Users/cairbin/Others/program/java/SmartHealthcare/data/logs" />
    <!-- 日志输出格式 -->
 		[...]
```



然后修改``./ruoyi-admin/src/resources/application.yml`的文件路径

```yml
# 项目相关配置
ruoyi:
  # 名称
  name: RuoYi
  # 版本
  version: 3.8.8
  # 版权年份
  copyrightYear: 2024
  # 文件路径 示例（ Windows配置D:/ruoyi/uploadPath，Linux配置 /home/ruoyi/uploadPath）
  profile: /Users/cairbin/Others/program/java/SmartHealthcare/data/uploadPath
  # 获取ip地址开关
  addressEnabled: false
  # 验证码类型 math 数字计算 char 字符验证
  captchaType: math
  
  [...]
```



创建数据库`db_smarthealth`，并执行`./sql`下的所有SQL脚本，并修改`./ruoyi-admin/src/resources/application-druid.yml`数据库连接信息。



运行`./ruoyi-admin/src/main/java/com/ruoyi/RuoYiApplication.java`来启动后端。



在`./ruoyi-ui`执行命令安装依赖并启动项目

```sh
npm install
npm run dev
```



### 部署项目

正式部署项目请参考RuoYi-Vue文档(https://gitee.com/y_project/RuoYi-Vue)