// 전체선택
function chooseAll(e){
  // product-area에 있는 모든 input을 꺼내와서 checkbox에 담아준다.
  const checkbox = document.querySelectorAll('#product-area input[type="checkbox"]')
  for (let i = 0; i < checkbox.length; i++) {
    // 타겟이 전체선택 checkbox가 체크 되면 product-area에 있는 checkbox들이 체크 된다.
    checkbox[i].checked = e.target.checked
  }
  cookCheck();
}
document.querySelector('#all').addEventListener('change', chooseAll)

$('#all').click();

// 전체삭제  및 선택 삭제
function deleteList() {
  const prodNoList = [];
  const checkbox = document.querySelectorAll('#product-area input[type="checkbox"]')
  for (let i = 0; i < checkbox.length; i++) {
      if(checkbox[i].checked === true){
          prodNoList.push(checkbox[i].value); 
          // i번째 체크박스의 값을 proNoList에 넣어줌.
      }
  }
  $.ajax({
      method: 'POST',
      url: '/cookTeacher/cart/delete',
      traditional : true,
      data: {
          prodNo: prodNoList
      },
      success: function (x){
        const resultList = JSON.parse(x);
        for (let i = 0; i < resultList.length; i++) {
            $(`input[value=`+ resultList[i] +`]`).parent().remove()
        }
        checkEmpty();
        cookCheck();
    }
  })
     
  
}

// 한개 삭제
function deleteOne(prodNo) {
  $.ajax({
      method: 'POST',
      url: '/cookTeacher/cart/delete',
      traditional : true,
      data: {
          prodNo: [prodNo]
      },
      success: function (result){
          
        $(`input[value=`+ prodNo +`]`).parent().remove() // 페이지 새로고침
        checkEmpty();
        cookCheck();
      }  
  })
}

function checkEmpty(){
    if(!document.querySelectorAll('li.product').length){
        const area = document.querySelector('#product-area>.empty')
        area.innerHTML = '<div class="none-cart"><p>장바구니에 담긴 상품이 없습니다.</p></div>'
    }
}

// 개수 수정
function changeCnt(prodNo, var_cnt){
  const cnt = $('input[value='+ prodNo +']').siblings('.count-wrapper').find('.count').text();
  // prodNo를 가진 input의 형제 중 count wrapper 찾아서 그 자손의 count를 찾아 text(값)을 가져와 cnt에 넣어준다.

  const changed_cnt = parseInt(cnt) + var_cnt;
  // cnt는 문자열이기 때문에 int로 변환 시켜 var_cnt를 계산 함.

  if(changed_cnt > 0){

      $.ajax({
          method: 'POST',
          url: '/cookTeacher/cart/cnt',
          traditional : true,     // 데이터 넘어가게 해주기
          data : {
              prodNo,
              cnt: changed_cnt // 넘겨줄 데이터
          },
          success: function(result){    // 성공하면 실행할 함수
            console.log(result)
            if (result != 0) {
                $(`input[value=`+ prodNo +`]`).siblings('.count-wrapper').find('.count').text(changed_cnt)
    
                let itemPrice = $(`input[value=`+ prodNo +`]`).siblings('input[name=itemPrice]').val();
                let totalPrice = itemPrice * changed_cnt;
                $(`input[value=`+ prodNo +`]`).siblings('input[name=price]').val(totalPrice)
                $(`input[value=`+ prodNo +`]`).siblings('.price').find('span').text(totalPrice.toLocaleString());
    
                cookCheck();

            }
          }
      });
  }
  
}

// 선택된 상품 가져오기
function cookOrder(){
    const checkArr = document.querySelectorAll('#product-area input[name=check]');
    for(let i = 0; i < checkArr.length; i++){
        if(checkArr[i].checked === true){
            return;
        }
    }
    for(let i = 0; i < checkArr.length; i++){
        checkArr[i].checked = true
    }
}

function cookCheckAll(){
    cookCheck();
}

function cookCheckOne() {
    
    document.querySelector('#all').checked = false;
    cookCheck();
}

// 체크시 가격 / 수량 / 배송비 계산해서 나타내기
function cookCheck() {

    let checkArr = document.querySelectorAll('#product-area input[name=check]');
    let price = document.querySelectorAll('#product-area input[name=price]');
    let cnt = 0;
    let totalPrice = 0;


    for(let i = 0; i < checkArr.length; i++){
        if(checkArr[i].checked === true){
            totalPrice += parseInt(price[i].value);
            cnt += 1;
        }
    }

    let productPrice = document.getElementsByClassName('productPrice')
    for(let i = 0; i < productPrice.length; i++){
        productPrice[i].innerHTML = totalPrice.toLocaleString(undefined, {maximumFractionDigits: 5});
    }

    let deliveryFee = document.getElementsByClassName('deliveryFee')
    
    let delivery = 0;
    if(totalPrice <= 30000 && totalPrice !== 0){
        delivery = 2500;
    }

    for(let i = 0; i < deliveryFee.length; i++){
        deliveryFee[i].innerHTML = delivery.toLocaleString(undefined, {maximumFractionDigits: 5});

    }
        

    let realTotalPrice = totalPrice + delivery;
    let totalPriceList = document.getElementsByClassName('realTotalPrice')

    for(let i = 0; i < totalPriceList.length; i++){
        totalPriceList[i].innerHTML = realTotalPrice.toLocaleString(undefined, {maximumFractionDigits: 5});
    }

    document.getElementById('cnt').innerText = cnt;
}

