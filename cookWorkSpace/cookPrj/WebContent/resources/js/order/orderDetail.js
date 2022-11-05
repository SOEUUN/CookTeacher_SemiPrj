function cancel(orderNo){
  $.ajax({
    method: 'POST',
    url: '/cookTeacher/order/delete',
    traditional : true,
    data: {
      orderNo : orderNo
    },
    success : function(x){
      location.reload();
    }


  })
}