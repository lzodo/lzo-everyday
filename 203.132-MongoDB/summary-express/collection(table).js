// 集合操作
db.createCollection("testuser");

// 查看已有的集合
// show collections;
// show tables;

// 删除集合 testuser
db.testuser.drop();

// 增，插入数据
for (var i = 0; i < 10; i++) {
    db.testuser.insert({ name: `Name${i}`, age: 10 + i });
}

db.testuser.insert({ name: "1", age: 2 });

// 删除数据
db.testuser.remove({}); // 删除所有
db.testuser.remove({ a: 1 }); // 删除 a=1 的文档

// 编辑
db.testuser.update({ name: "1" }, { b: 5 }); // 让 name: "1" 的文档，所有值替换成 b = 5
db.testuser.update({ name: "2" }, { $set: { b: 5 } }); // 让 name: "2" 的文档，b 修改为 5
db.testuser.update({ name: "Name6" }, { $push: { list: "ele" } }); //给name=Name6 的文档添加list字段，它是一个数组

// 查
db.testuser.find();
db.testuser.find({ age: 10 });
db.testuser.find({ age: { $lt: 20 } });
