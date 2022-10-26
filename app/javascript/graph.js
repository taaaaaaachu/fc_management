	$(document).on('turbolinks:load', function() {
		var ctx = document.getElementById("myPieChart");
		if (ctx == null){
			return;
		}
		var post_details = gon.post_details;
		var myPieChart = new Chart(ctx, {




    type: 'pie',
    data: {
      labels: gon.graph_post_title,
      datasets: [{
          backgroundColor: [
              "#BB5179",
              "#FAFF67",
              "#58A27C",
              "#3C00FF"
          ],
          data: gon.graph_post_price
      }]
    },
    options: {
      title: {
        display: true,
        text: '固定費 割合'
      }
    }
  });
});