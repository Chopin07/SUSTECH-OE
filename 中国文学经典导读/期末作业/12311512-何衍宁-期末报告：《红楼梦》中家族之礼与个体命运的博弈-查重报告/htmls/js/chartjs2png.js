const fs = require('fs');
const {
  ChartJSNodeCanvas
} = require('chartjs-node-canvas');

const width = 400; //px
const height = 400; //px
const canvasRenderService = new ChartJSNodeCanvas({
  width,
  height
});

(async () => {
  const configuration = {
    type: 'doughnut',
    data: {
      datasets: [{
        label: '检测结果统计图',
        data: [100, 50, 50],
        backgroundColor: [
          'rgb(255, 99, 132)',
          'rgb(54, 162, 235)',
          'rgb(255, 205, 86)'
        ],
      }]
    },
    options: {
      elements: {
        arc: {
          borderWidth: 0,
        },
      },
      responsive: false,
    }
  };

  const imageBuffer = await canvasRenderService.renderToBuffer(configuration);
  // Write image to file
  fs.writeFileSync('../images/chart-doughnut.png', imageBuffer);
})();