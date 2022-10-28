// 주소api
function searchAddr(){
    new daum.Postcode({
        oncomplete: function(data) {
            $('#addr').val(data.address);
            $('#detailAddr').val("");
            $('#detailAddr').attr('readonly', false);
        }
    }).open();
}

// 결제하기
// function checkOut() {
//   const cartList = document.querySelectorAll('input[name=prodNo]');
//   const prodNoList = [];

//   for(let i = 0; i < cartList.length; i++){
//     prodNoList.push(cartList[i].value);
//   }
  
//   const point = document.querySelector('input[name=save-point]').value

//   $.ajax({
//     method: "POST",
//     url:"/cookTeacher/order/success",
//     traditional: true,
//     data: {
//       check : prodNoList,
//       point : point
//     },

//   })

// }