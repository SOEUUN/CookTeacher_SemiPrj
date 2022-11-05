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

let realTotalPrice = totalPrice + deliveryFee;

function clickPoint(){
  const usedPoint = document.querySelector('input[name=save-point]').value
    if(usedPoint && usedPoint <= point){
        document.querySelector('.price>.usePoint').innerHTML = usedPoint + 'P'
        document.querySelector('input[name=usePoint]').value = usedPoint
    
        document.querySelector('label[for=point]').innerHTML = '포인트 ' + (point - parseInt(usedPoint)) + 'P';
        document.querySelector('.sum-amt>strong').innerHTML = (totalPrice + deliveryFee - parseInt(usedPoint)).toLocaleString();

        realTotalPrice = (totalPrice + deliveryFee - parseInt(usedPoint));
    }
}

var IMP = window.IMP; // 생략 가능
IMP.init("imp06204768");
 // 예: imp00000000


    function requestPay() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "INIpayTest",
          merchant_uid : 'merchant_'+new Date().getTime(),
          name: prodName,
          amount: realTotalPrice,
          buyer_email: email,
          buyer_name: name,
          buyer_tel: phone,
          buyer_addr: addr,
          // buyer_postcode: "01181"
      }, function (rsp) { // callback
          if (rsp.success) {
            $('input[name=payment]').val(rsp.pay_method)
            $('form').submit()
          } else {
             console.log(rsp)
          }
        })
      }


  