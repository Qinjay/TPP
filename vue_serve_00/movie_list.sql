-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-07-01 03:54:31
-- 服务器版本： 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tpp`
--

-- --------------------------------------------------------

--
-- 表的结构 `movie_list`
--

CREATE TABLE `movie_list` (
  `mid` int(11) NOT NULL,
  `mtitle` varchar(64) CHARACTER SET utf8 NOT NULL,
  `subtitle` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `screen` varchar(32) CHARACTER SET utf8 NOT NULL,
  `release_time` datetime NOT NULL COMMENT '上映时间',
  `score` decimal(2,1) DEFAULT NULL COMMENT '评分',
  `mdirect` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '0.0' COMMENT '导演',
  `mstar` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '主演',
  `m_type` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '电影类型',
  `district` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '制片国家/地区',
  `mlegth` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '片长',
  `introduction` varchar(1024) CHARACTER SET utf8 NOT NULL COMMENT '介绍',
  `isonload` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `movie_list`
--

INSERT INTO `movie_list` (`mid`, `mtitle`, `subtitle`, `screen`, `release_time`, `score`, `mdirect`, `mstar`, `m_type`, `district`, `mlegth`, `introduction`, `isonload`) VALUES
(1, '黑衣人：全球追缉', 'Men in Black International', '3D IMAX', '2019-06-14 00:00:00', '7.0', 'F·加里·格雷', '克里斯·海姆斯沃斯,泰莎·汤普森,丽贝卡·弗格森,连姆·尼森,艾玛·汤普森', '动作,科幻,喜剧', '美国', '115分钟', '全球最具影响力的经典科幻IP《黑衣人》全面升级！科幻电影之父史蒂文·斯皮尔伯格联手《速度与激情8》导演F·加里·格雷，金牌班底鼎力巨献！英国黑衣人总部王牌探员H（锤哥）与新晋探员M（泰莎·汤普森）在阻止外星团伙入侵的过程中意外铲除了隐藏在黑衣人组织中的内奸，成功拯救世界。 影片中，各种全球最具影响力的经典科幻IP《黑衣人》全面升级！脑洞大开的外星人和颠覆想象的高科技装备轮番登场，热血沸腾惊心动魄的动作追车场面层出不穷，完美构建出全新的黑衣人宇宙观。本片将于2019年6月14日内地公映。', 1),
(2, '最好的我们', 'My Best Summer', '2D 中国巨幕', '2019-06-06 00:00:00', '8.3', '章笛沙', '陈飞宇,何蓝逗,惠英红,陶慧敏,汪苏泷,董力,周楚濋', '剧情,爱情', '中国大陆', '110分钟', '每个人的心里大概都藏着一个念念不忘的人。一个偶然被提及的名字，让女摄影师耿耿（何蓝逗 饰）内心掀起万千波澜，触动了回忆的开关，那个撩人心动的少年余淮（陈飞宇 饰）再度闯进她的思绪。那是记忆里最好的时光，“学渣”耿耿和“学霸”余淮成了同桌，还结识了简单（王初伊 饰）、贝塔（周楚濋 饰）、徐延亮（陈帅 饰）。校园里充盈着专属少男少女们的懵懂、青涩、怦然心动和勇敢，耿耿余淮也拥有了他们的约定。高考后，当耿耿满怀期待憧憬约定兑现之时，余淮却忽然消失不见了。七年后两人重逢，余淮当年未说出口的那句话、他不辞而别的秘密，耿耿能否得到解答？这段耿耿于怀的过往，让两人再度面临情感的抉择…… 本片根据八月长安同名小说作品改编。', 1),
(3, '妈阁是座城', '', '2D 中国巨幕', '2019-06-14 00:00:00', '8.2', '李少红', '白百何,黄觉,吴刚,刘嘉玲', '爱情,剧情', '中国大陆', '127分钟', '女叠码仔梅晓鸥（白百何饰）历尽沧桑，在妈阁（澳门）这座赌城中与来历迥异的赌徒打交道，有地产商段凯文（吴刚饰）、有艺术家史奇澜（黄觉饰），也有来自不同阶级的政商人员，连早已堕落低谷的前夫卢晋桐（耿乐饰）都重新卷入她的人生。这些人入赌场就搏杀，出赌场就赖账，女叠码仔过的就是放债和讨债的生活。赌博让人迷失本性，叠码仔与赌徒周旋，也等于与魔鬼打交道，一时假仁假义，一时恩断情绝，赌至终局，谁能寻回本性，谁能鸿运当头？', 1),
(4, '秦明·生死语者', 'Whisper of Silent Body', '', '2019-06-14 00:00:00', NULL, '李海蜀, 黄彦威', '严屹宽,代斯,耿乐,郑晓宁,郝劭文,释彦能', '悬疑,犯罪', '中国大陆', '104分钟', '影片根据法医秦明小说《尸语者》改编。讲述被誉为“鬼手佛心”的“尸语者”秦明（严屹宽饰）解剖过 1000 多具尸体，从未出错，因意外发现泡在福尔马林里6年的“无语体师”死于他杀，引发媒体质疑误判，被舆论推至风口浪尖之上。在尸体留下的线索指引下，秦明在实习助手嘉嘉（代斯饰）和刑警队长林涛（耿乐饰）的协助调查下发现了尘封 16 年的雪灾杀人案、误判 6 年的“无语体师”他杀案、悬而无果的 IT 男肺炸案背后的秘密。经历了这一系列变故的秦明最终成为了一名“为死者言，为生者权”的“生死语者”。', 1),
(5, 'X战警：黑凤凰 ', 'X-Men: Dark Phoenix', '3D IMAX', '2019-06-06 00:00:00', '7.1', '西蒙·金伯格', '索菲·特纳,詹姆斯·麦卡沃伊,迈克尔·法斯宾德,詹妮弗·劳伦斯', '动作,科幻,冒险', '美国', '114分钟', '影片剧情围绕X战警中最受欢迎成员之一的琴·葛蕾展开，讲述她逐渐转化为黑凤凰的故事。在一次危及生命的太空营救行动中，琴被神秘的宇宙力量击中，成为最强大的变种人。此后琴·葛蕾不仅要设法掌控日益增长、极不稳定的力量，更要与自己内心的恶魔抗争，她的失控让整个X战警大家庭分崩离析，也让整个星球陷入毁灭的威胁之中。《X战警：黑凤凰》是迄今为止气氛最紧张、情感最丰富的一部《X战警》电影，是《X战警》系列20年来的集大成之作，大家非常熟悉和热爱的变种人大家庭即将面对最为强大的敌人——而她恰恰还是他们中的一员。', 1),
(6, '千与千寻 ', '千と千尋の神隠し', '2D 中国巨幕', '2019-06-21 00:00:00', NULL, '宫崎骏', '周冬雨,井柏然,彭昱畅,田壮壮,王琳,柊瑠美,入野自由,夏木真理,中村彰男,内藤刚志', '动画,冒险,奇幻,家庭', '日本', '125分钟', '千寻和爸爸妈妈一同驱车前往新家，在郊外的小路上不慎进入了神秘的隧道——他们去到了另外一个诡异世界—一个中世纪的小镇。远处飘来食物的香味，爸爸妈妈大快朵颐，孰料之后变成了猪！这时小镇上渐渐来了许多样子古怪、半透明的人。千寻仓皇逃出，一个叫小白的人救了他，喂了她阻止身体消 失的药，并且告诉她怎样去找锅炉爷爷以及汤婆婆，而且必须获得一分工作才能不被魔法变成别的东西。千寻在小白的帮助下幸运地获得了一份在浴池打杂的工作。渐渐她不再被那些怪模怪样的人吓倒，并从小玲那儿知道了小白是凶恶的汤婆婆的弟子。一次，千寻发现小白被一群白色飞舞的纸人打伤，为了救受伤的小白，她用河神送给她的药丸驱出了小白身体内的封印以及守封印的小妖精，但小白还是没有醒过来。为了救小白，千寻又踏上了她的冒险之旅。', 0),
(7, '我的青春都是你 ', 'Love the Way You Are', '2D 中国巨幕', '2019-06-21 00:00:00', NULL, '周彤, 代梦颖', '宋威龙,宋芸桦,林妍柔,黄俊捷,金士杰', '爱情', '中国大陆,中国台湾', '92分钟', '改编自小说《北大差生》，讲述了学渣周林林和“隔壁家的学霸”方予可之间的酸甜爱情故事。本以为高考结束就可以分道扬镳，没想到阴差阳错，两人一同考进了全国最高学府的最冷门专业——畜牧系。为了弥补曾经无意间给方予可造成的“初恋创伤”，周林林千方百计帮方予可追回“校花初恋”，自己却在不知不觉中掉进了青春的陷阱…毕业季即将来临，深藏你青春回忆深处的那个 TA 是否还在你的身边？', 0),
(8, '哥斯拉2：怪兽之王 ', 'Godzilla?King of Monsters', '3D IMAX', '2019-05-31 00:00:00', '9.9', '迈克尔·道赫蒂', '凯尔·钱德勒,米莉·博比·布朗,维拉·法梅加,莎莉·霍金斯,托马斯·米德蒂奇,布莱德利·惠特福德', '科幻,灾难,动作', '美国', '132分钟', '随着《哥斯拉》和《金刚：骷髅岛》在全球范围内的成功，华纳兄弟影片公司和传奇影业联手开启了怪兽宇宙系列电影的新篇章—一部史诗级动作冒险巨制。在这部电影中，哥斯拉将和众多大家在流行文化中所熟知的怪兽展开较量。全新故事中，研究神秘动物学的机构“帝王组织”成员将勇敢直面巨型怪兽，其中强大的哥斯拉也将和魔斯拉、拉顿和它的死对头——三头王基多拉展开激烈对抗。当这些只存在于传说里的超级生物再度崛起时，它们将展开王者争霸，人类的命运岌岌可危……', 1),
(9, '阿拉丁 ', 'Aladdin', '3D IMAX', '2019-05-24 00:00:00', '8.8', '盖·里奇', '梅纳·玛索德,娜奥米·斯科特,威尔·史密斯,马尔万·肯扎里', '爱情,奇幻,冒险', '美国', '128分钟', '在充满异域风情的古代阿拉伯王国，善良的穷小子阿拉丁（莫纳·马苏德 饰）和勇敢的茉莉公主（娜奥米·斯科特 饰）浪漫邂逅，在可以满足主人三个愿望的神灯精灵帮助下，两人踏上了一次寻找真爱和自我的魔幻冒险。', 1),
(10, '八佰', '', '2D 中国巨幕', '2019-07-05 00:00:00', NULL, '管虎', '姜武,张译,王千源,黄志忠,张俊一,欧豪,胡晓光,张承', '剧情,战争,历史', '中国大陆', '160分钟', '1937年淞沪会战末期，国民革命军第88师524团留守上海四行仓库，与租界一河之隔，孤军奋战4昼夜，造就了罕见的被围观的战争；为壮声势，四百人对外号称八百人。 电影《八佰》由管虎导演，是亚洲首部全片使用IMAX摄影机拍摄的商业影片，将于2019年7月5日全国上映。', 0),
(11, '榫卯 ', 'Country Far Away', '2D 中国巨幕', '2019-06-16 00:00:00', NULL, '甘小二', '马跃,徐筠,黄精一,谢翔,戴佳夕,朱羿霖', '剧情', '中国大陆', '101分钟', '古建复建工程师陈文远，对城市化、现代性产生了怀疑和抵触，决定辞职，返回家乡田园生活。妻子是房地产设计师，坚决反对陈文远的返乡计划。此时，陈文远在工地遇到了自己的父亲，原是他千里之外的家祠亦被买来此地。父子异地重建家祠。然而，作为家祠灵魂的匾额，却一直不知所踪，讳莫如深的父亲不辞而别。直到文远一家三口在文远母亲祭日返乡，他才终于明白了父亲对母亲的感情，以及父亲不愿碰触的内心伤痛。最后，陈家祠完美重建，而那个他记忆中的乡土中国，已经一去不返。', 0),
(12, '大河唱', '', '2D 中国巨幕', '2019-06-18 00:00:00', NULL, '柯永权, 杨植淳, 和渊', '苏阳,刘世凯,魏宗富,马风山,张进来', '纪录片,音乐', '中国大陆', '98分钟', '沿黄河出发，从源头无人区到入海口，历时3年，跨越七十万平方公里……《大河唱》记录了一位从河边出走的当代艺术家和四位固守土地的民间艺人：说书人刘世凯、花儿歌手马风山、百年皮影班班主魏宗富、民营秦腔剧团团长张进来，和探寻用中国人自己的方式歌唱当下的艺术家苏阳。', 0),
(13, '玩具总动员4 ', 'Toy Story 4', '3D IMAX', '2019-06-21 00:00:00', NULL, '乔什·库雷', '汤姆·汉克斯,蒂姆·艾伦,安妮·波茨,唐·里克斯,琼·库萨克,迈克尔·基顿', '喜剧,动画,奇幻', '美国', '100分钟', '在皮克斯动画工作室创造了全球第一部电脑动画《玩具总动员》将近20年后，皮克斯正式宣布迪士尼·皮克斯《玩具总动员4》将于2019年6月21日上映，邀观众们再次与熟悉的角色共赴精彩刺激的冒险旅程。 而更令人欣喜的消息是《玩具总动员》与《玩具总动员2》的导演约翰·拉塞特将回归执导这第四部作品。本集故事由拉塞特、安德鲁·斯坦顿、彼特·道格特、李·昂克里奇构想，他们正是前三部《玩具总动员》最关键的幕后推手，观众热爱的胡迪、巴斯光年以及玩具小伙伴们的生活也将翻开全新篇章。', 0),
(14, '狮子王', 'The Lion King', '3D IMAX', '2019-07-12 00:00:00', '0.0', '乔恩·费儒', '唐纳德·格洛弗,碧昂丝·诺尔斯,詹姆斯·厄尔·琼斯,切瓦特·埃加福特,阿尔法·伍达德', '剧情,动画,冒险,歌舞', '美国', '', '由乔恩·费儒执导的全新《狮子王》把故事带回到非洲大草原上，在那里，一个未来的万兽之王刚刚诞生。辛巴崇拜自己的父亲狮王木法沙，也深知自己肩负着的王室命运。但并非王国里的每位成员都在庆祝小王子的降临——作为前王位继承者，狮王木法沙的弟弟刀疤有着自己的盘算。这场对王位的争夺蹂躏着荣耀大地，伴随着背叛、悲剧和冲突，最终导致辛巴的流放。接着辛巴结识了一对古怪的新朋友，在他们的帮助下，他将学会成长并夺回本该属于自己的一切。', 0),
(15, '冰雪女王4：魔镜世界', 'THE SNOW QUEEN: MIRRORLANDS', '3D IMAX', '2019-08-02 00:00:00', NULL, '阿列克谢·特斯蒂斯林, 刘凌峰', '姜武,张译,王千源,黄志忠,张俊一,欧豪,胡晓光,张承', '动画,冒险,奇幻', '俄罗斯,美国', '87分钟', '在由哈拉德统治的国家，有一群特别的人，他们天生拥有魔法，和普通人一起幸福的生活在这个繁荣的国度。漂亮女孩格尔达是自己四口之家中唯一不会魔法的人，她为此感到苦恼，并一直寻求唤醒自己魔法的力量。然而国王哈拉德精通科学认为魔法只会带来邪恶，假意发布告示：每一位会魔法的人将国王邀请去宫殿里表演魔法，想要让魔法师在这片大陆消失。格尔达的父母和弟弟被邀请离开之后，王国内的魔法师陆续失踪，格尔达无意间得知了国王的真正意图，于是义无反顾的踏上了解救家人的道路，却历经坎坷被捕入狱。格尔达的前敌冰雪女王向格尔达伸出援手，想要共同解救被困住的魔法师们，此时的格尔达是否会接受和前敌冰雪女王联手并让国王找回初心呢？', 0),
(16, '全职高手之巅峰荣耀', '', '2D 中国巨幕', '2019-06-18 00:00:00', NULL, '史涓生, 邓志巍', '阿杰,边江,西子,夏磊,刘康,郭浩然,张思王之,锦鲤,风袖,张喆,文靖渊,张沛,宝木中阳,闫紫境,管泽元,米勒', '剧情,动画', '中国大陆', '90分钟', '电子竞技成为全国第78个体育赛事，“荣耀”将首次举办职业联赛。18岁的叶秋（本名叶修）与好友苏沐秋，在网吧老板陶轩的协助下，开始组建草根电竞战队“嘉世 ”。同时，来自全国各地不同背景的队友们也因为梦想齐聚一堂，为着电竞舞台的最高荣耀而刻苦训练。嘉世一路过关斩将，即将冲进决赛之际，团队却遭遇危机。面对劲敌皇风战队来势汹汹，作为队长的叶秋要如何解决眼前的困境？这样一群怀揣梦想的少年，是否能够登上荣耀的巅峰？', 0),
(17, '日月', 'Saga of Light', '', '2019-06-21 00:00:00', NULL, '金依萌', '迪丽热巴,窦骁,李子峰,杨森,倪虹洁', '喜剧,家庭,奇幻', '中国大陆,澳大利亚', '110分钟', '这是一个颠覆神话传说的故事。在远古时期的海滨小镇金鱼村，美丽的少女嫦娥和森林少年后羿是一对两小无猜的欢喜冤家。崇尚自由的嫦娥厌倦了小渔村枯燥平淡的生活，一心想去探索外面的世界。在她打算离家出走的这天，突如其来的龙王选妃盛典打破了这里的平静……', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movie_list`
--
ALTER TABLE `movie_list`
  ADD PRIMARY KEY (`mid`),
  ADD KEY `release_time` (`release_time`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `movie_list`
--
ALTER TABLE `movie_list`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
