
ECMAScript 中文
====

## 关于该仓库

该仓库包含[ECMAScript®语言规范](https://github.com/tc39/ecma262)当前草案(包含stage 2 - stage 4)的中文翻译，你可以在一下网站进行浏览。
- [英文](https://tc39.github.io/ecma262/)
- 中文

## 贡献

### 加入我们

![微信群](http://oh1syxf94.bkt.clouddn.com/IMG_2003.JPG)

> 微信：17764592171

### 约定
- **LN** 表示文档行号
- **issues** 表示github的issues菜单
- **pull request** 表示github的pull request功能

### 角色
- 项目维护者 负责对翻译分支，校对分支，cn分支的管理。
- 校对者 负责指出新翻译内容中错译、漏译、标点符号错误、错别字、大小写、拼写错误、单复数、动词时态、数字错误等错误
- 翻译参与者 从[issues](https://github.com/docschina/ecma262/issues)中选择自己希望翻译的内容在本地进行翻译，具体翻译流程可查看**翻译流程**
- 审校者 负责对翻译内容的语句润色，通顺，专业性等工作

### 分支管理

- [translated](https://github.com/docschina/ecma262/tree/translated) 翻译分支。对于该分支下被合并的内容将永远存在，除非被新内容覆盖。
- [checking](https://github.com/docschina/ecma262/tree/checking) 审校分支。
- [cn](https://github.com/docschina/ecma262/tree/cn) 发布分支。使用工具进行自动部署

### 翻译流程

- 翻译参与者`fork`此仓库到个人仓库，在本地检出`translated`分支。
  - 在`issues`列表中选择`label`为[`待翻译`](https://github.com/docschina/ecma262/issues?utf8=%E2%9C%93&q=is%3Aissue+is%3Aopen+label%3A%E5%BE%85%E7%BF%BB%E8%AF%91)的`issue`，确认认领翻译任务并通知(@)**项维护者者**(修改`label`为`翻译中`)
  - 翻译参与者请在`translated`文件夹的`issues-[ISSUE ID].html`文件中进行对原文进行翻译。（**为了方便校对时使用github进行校对**）
  - 翻译完成后
    - 使用`issues-[ISSUE ID]`替换`spec.html`文件中相应的英文原文，并保证`npm run build`顺利通过，并检查内容与期待结果一样
    - 丢弃`spec.html`文件更改内容
    - 提交翻译内容（**最好是多个提交先在本地合并为一个提交**），建议`commit message`为**translated：[LN - LN] issue #ISSUE ID**(为了审校时方便替换)
- 翻译参与者将翻译内容推送到自己的公开仓库。
- 翻译参与者使用`github`的`pull request`通知维护者，请求拉取自己的更新。
- 翻译参与者应该关注相应`issue`，**校对者**会在此`issue`提交`review`意见，直到提交被合并，对于长时间（**距离`issue`中最后的评论时间超过三天**）未被接受的`pull request`如果在相应`issue`中没有找到拒绝理由，可以直接联系维护者问名原因。

### 合并流程

- 接受`pull request` **项维护者者**
  - 在本地对新的`pull request`进行如下处理
    - **项目维护者**从翻译参与者提交的`pull request`中合并翻译内容，并保证可以成功`build`，且内容格式与原文无误
      - 通过，在对应的`issue`添加`lable`——`待校对`，附上校对地址
      - 失败，在对应的`pull request`评论拒绝原因

- 校对 **任何人**
  - 任何人可对`label`为`待校对`的`issue`对应的`pull request`进行`review`，并作出意见（参考掘金的[参与校对的正确姿势](https://github.com/xitu/gold-miner/wiki/%E5%8F%82%E4%B8%8E%E6%A0%A1%E5%AF%B9%E7%9A%84%E6%AD%A3%E7%A1%AE%E5%A7%BF%E5%8A%BF)）
  - 如果有修改意见，翻译者应在原分支上进行修改(**不需重新`pull request`**)，并在对应`issue`通知（@）**校对者**和**项维护者者**修改完成
  - **项维护者者**检查`issue`状态
    - 所有`review`意见修改完成或没有意见且距离`pull request`时间超过三天，接受合并，修改对应`issue`的`label`为`待审校`

- 审校 **审校负责人**
  - 可能邀请大神对翻译内容进行审校，这将是本次提交的最后检查，提交内容可能在该阶段进行一些专业性的修改，和语句上的润色
  - 由通过对比`translated`与`checking`分支，每次从`translated`分支`cherry-pick`第一个不同的提交版本进行合并
  - 使用需审校提交的译文替换`spec.html`中对应的部分。
  - 提交`checking`分支，审校团队进行讨论修改，确认无误表示完成审校流程。
  - 完成审校后通知**项维护者者**或者**审校负责人**进行合并到`cn`分支
  - 修改对应`issue`的`label`为`已发布`
  - 提交审校完成，进入下一轮审校流程

- 发布
  - 使用工具在每次`checking`分支的修改后对该分支进行部署
  - 使用工具在每次`cn`分支的修改后对该分支进行部署
  
  > 两个分支在不同的域查看

- 追踪`tc39` **项维护者者**
  - 在`master`分支跟踪`tc39/master`分支
  - 使用`diff`检出修改内容
  - 构建任务
  - 重复整个流程

> 可能具体合并流程还会修改，但是对于翻译阶段不受影响

