// 定义全局常量
const quoute_tpl_1 = '主要责任者. 文献题名[J]. 刊名, 出版年份, 卷号(期号):起止页码.'; // 1．期刊(journal)
const quoute_tpl_4 = '主要责任者. 文献题名[D]. 保存地: 保存单位, 年份.'; //2．学位论文(dissertation)

/**
 * 根据大学名称搜索其文献保存地（即大学所在省份）
 * @param {string} school
 */
function searchCityBySchool(school) {
  var schoolCity = '';
  // schoolList 数据位于 china_mainland_universities.js 文件中
  for (var idx in schoolList) {
    for (var jdx in schoolList[idx]['all']) {
      if (schoolList[idx]['all'][jdx] == school) {
        schoolCity = idx;
        break;
      }
    }
    if (schoolCity != '') break;
  }
  return schoolCity;
}

/**
 * 监听自动生成引用的点击事件
 */
$('.copy-quote').click(function () {
  createQuoute($(this));
})

/**
 * 自动生成引用，现仅支持「期刊」与「学位论文」
 */
function createQuoute(obj) {
  // 获取当前选中的元素
  var curObj = $(obj.parent().parent()[0]);
  // 获取详细信息
  var innerText = curObj.context.innerText;
  // 文献信息
  var quoteList = innerText.split(/\n/);

  if (innerText.indexOf('（期刊）') != -1) { // 期刊类型引用
    if (quoteList && quoteList.length < 4) {
      console.warn('生成期刊引用的数据不完整！无法生成标准引用！');
      return;
    }
    var title = quoteList[0].split(/：/)[1].split(' ')[0];
    var author = quoteList[1].split(/：/)[1].replace(';', ', ');
    var publicationName = quoteList[2].split(/：/)[1];
    var period = quoteList[3].split(/：/)[1];
    var periodYear = period.replace(/(\d{4})年(\d)期/g, '$1');
    var periodMonth = appendDateZero(period.replace(/(\d{4})年(\d)期/g, '$2'));
    var publishedPage = '';
    if (quoteList[4]) publishedPage = quoteList[4].split(/：/)[1].replace(/P(.)/, '$1');

    // [序号]主要责任者．文献题名[J]．刊名，出版年份，卷号(期号)：起止页码．
    var quoute = quoute_tpl_1.replace('主要责任者', author)
      .replace('文献题名', title)
      .replace('刊名', publicationName)
      .replace('出版年份, 卷号(期号)', periodYear + "(" + periodMonth + ")");
    if (publishedPage) {
      quoute = quoute.replace('起止页码', publishedPage);
    }else{
      quoute = quoute.replace(':起止页码', '');
    }
  } else if (innerText.indexOf('（学位）') != -1) { // 学位类型引用
    if (quoteList && quoteList.length < 5) {
      console.warn('生成学位论文引用的数据不完整！无法生成标准引用！');
      return;
    }
    var title = quoteList[0].split(/：/)[1].split(' ')[0];
    var author = quoteList[1].split(/：/)[1].replace(';', ', ');
    var school = quoteList[2].split(/：/)[1];
    var schoolCity = searchCityBySchool(school);
    var year = quoteList[4].split(/：/)[1].replace(/(\d{4})年/, '$1');

    // [序号]主要责任者．文献题名[D]．保存地：保存单位，年份．
    var quoute = quoute_tpl_4.replace('主要责任者', author)
      .replace('文献题名', title)
      .replace('保存地', schoolCity)
      .replace('保存单位', school)
      .replace('年份', year);
  } else {
    console.warn('抱歉，暂不支持其他类型的引用');
  }
  copyQuote(quoute, obj);
}

/**
 * 点击复制引用
 * @param {string} quote
 */
function copyQuote(quote, obj) {
  var clipboard = new Clipboard(".copy-quote", {
    text: function () {
      return quote;
    }
  });
  clipboard.on('success', function (e) {
    $(obj).html('复制成功！');
    $(obj).attr("style","color:red");
    timeCountDown(1,obj,"复制引用");
    clipboard.destroy();
  });
  clipboard.on('error', function (e) {
    console.log(e);
    clipboard.destroy();
  });
}

/**
 * 日期参数，不足两位时补零
 */
function appendDateZero(obj) {
  if (obj < 10) return "0" + obj;
  return obj;
}

/**
 * 倒计时执行元素渲染
 * @param {*} seconds
 * @param {*} obj
 * @param {*} msg
 */
function timeCountDown(seconds,obj,msg){
    timerInt = setInterval(function(){
        seconds--;
        if(seconds == 0){
            $(obj).html(msg);
            $(obj).attr("style","color:blue");
            clearInterval(timerInt);
            return;
        }
    },1000);
}