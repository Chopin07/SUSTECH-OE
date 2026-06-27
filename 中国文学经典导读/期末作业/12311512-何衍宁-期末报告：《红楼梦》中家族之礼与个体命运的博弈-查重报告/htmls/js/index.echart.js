// echart js setting
var my_chart_1 = echarts.init(document.getElementById('chart_1'));
// 指定图表的配置项和数据
var option_1 = {
  series: [
    {
      type: 'gauge',
      startAngle: 180,
      endAngle: 0,
      min: 0,
      max: 1,
      splitNumber: 8,
      radius: '80%',
      color: '#FF9933',
      markPoint: {
        symbol: 'circle',
        symbolSize: 16,
        data: [
          //跟你的仪表盘的中心位置对应上，颜色可以和画板底色一样
          { value: '', x: 'center', y: 'center', itemStyle: { color: '#FF9933' } },
        ],
      },
      itemStyle: {
        // 仪表盘指针样式。
        color: '#FF9933', // 指针颜色，默认(auto)取数值所在的区间的颜色
        opacity: 1, // 图形透明度。支持从 0 到 1 的数字，为 0 时不绘制该图形。
        borderWidth: 0, // 描边线宽,默认 0。为 0 时无描边。
        borderType: 'solid', // 柱条的描边类型，默认为实线，支持 'solid', 'dashed', 'dotted'。
        borderColor: '#000', // 图形的描边颜色,默认 "#000"。支持的颜色格式同 color，不支持回调函数。
        shadowBlur: 10, // (发光效果)图形阴影的模糊大小。该属性配合 shadowColor,shadowOffsetX, shadowOffsetY 一起设置图形的阴影效果。
        shadowColor: '#fff', // 阴影颜色。支持的格式同color。
      },
      axisLine: {
        lineStyle: {
          width: 14,
          color: [
            [0.25, '#FF6E76'],
            [0.5, '#FDDD60'],
            [0.75, '#58D9F9'],
            [1, '#7CFFB2'],
          ],
        },
      },
      pointer: {
        icon: 'path://M12.8,0.7l12,40.1H0.7L12.8,0.7z',
        length: '40%',
        width: 4,
        color: '#FE5F42',
        itemStyle: {
          color: '#FE5F42',
        },
      },
      axisTick: {
        length: 0,
        lineStyle: {
          color: '#FE5F42',
          width: 2,
        },
      },
      splitLine: {
        length: 0,
        lineStyle: {
          color: '#FE5F42',
          width: 0,
        },
      },
      axisLabel: {
        color: '#464646',
        fontSize: 10,
        distance: -25,
        formatter: function (value) {
          if (value === 0.875) {
            return '80%';
          } else if (value === 0.625) {
            return '60%';
          } else if (value === 0.375) {
            return '40%';
          } else if (value === 0.125) {
            return '20%';
          }
        },
      },
      title: {
        offsetCenter: [0, '-40%'],
        fontSize: 10,
      },
      detail: {
        fontSize: 24,
        fontWeight: 'bold',
        offsetCenter: [0, '-60%'],
        valueAnimation: true,
        formatter: function (value) {
          return Math.round(value * 100) + '%';
        },
        color: '#2E3A36',
      },
      data: [
        {
          value: 0.6,
          name: '总相似比',
        },
      ],
    },
  ],
};
// 使用刚指定的配置项和数据显示图表。
my_chart_1.setOption(option_1);

// 基于准备好的dom，初始化echarts实例
var my_chart_2 = echarts.init(document.getElementById('chart_2'));
// 指定图表的配置项和数据
var option_2 = {
  tooltip: {
    trigger: 'item',
    axisPointer: {
      // 坐标轴指示器，坐标轴触发有效
      type: 'shadow', // 默认为直线，可选为：'line' | 'shadow'
    },
  },
  legend: {
    width: '100px',
    top: 'center',
    left: '65%',
  },
  series: [
    {
      name: '访问来源',
      type: 'pie',
      radius: ['40%', '70%'],
      avoidLabelOverlap: false,
      label: {
        show: false,
        position: 'center',
      },
      emphasis: {
        label: {
          show: true,
          fontSize: '8',
          fontWeight: 'bold',
        },
      },
      labelLine: {
        show: false,
      },
      data: [
        { value: 1048, name: '总文字复制比', itemStyle: { color: '#FDBE11' } },
        { value: 735, name: '去除本人文字复制比', itemStyle: { color: '#FE5F42' } },
        { value: 580, name: '48.37%', itemStyle: { color: '#48BC7C' } },
      ],
    },
  ],
};
// 使用刚指定的配置项和数据显示图表。
my_chart_2.setOption(option_2);
