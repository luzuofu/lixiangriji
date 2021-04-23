# Share说明文档

## Useage
- 1.解压缩之后会得到5个文件（夹），分别为share.sql,share-wx,share-admin-vue,share-server,share-admin-server
- 2. 先导入share.sql到数据库创建好表和数据库，其次share-wx用微信开发工具打开，share-admin-vue用npm进行构建，share-*server*的部分均用idea打开构建
- 3.本项目使用了阿里云对象存储服务，所以需要自行购置OSS服务，在share-server的配置文件中填写对应的配置


>注意:share-admin-vue项目本身是才用yarn构建的，建议使用yarn
