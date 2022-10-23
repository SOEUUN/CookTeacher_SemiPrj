// 전체선택
function chooseAll(e){
  // product-area에 있는 모든 input을 꺼내와서 checkbox에 담아준다.
  const checkbox = document.querySelectorAll('#product-area input[type="checkbox"]')
  for (let i = 0; i < checkbox.length; i++) {
    // 타겟이 전체선택 checkbox가 체크 되면 product-area에 있는 checkbox들이 체크 된다.
    checkbox[i].checked = e.target.checked
  }
}
document.querySelector('.choose-all').addEventListener('click', chooseAll)

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
      success: function (){
          location.reload(); // 페이지 새로고침
      }  
  })
      // success: function (x){
      //     const resultList = JSON.parse(x);

      //     for (let i = 0; i < resultList.length; i++) {
      //         $(`input[value=`+ resultList[i] +`]`).parent().remove()
      //     }
      // }
  
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
      success: function (){
          location.reload(); // 페이지 새로고침
      }  
  })
}

// 개수 수정
function changeCnt(prodNo, var_cnt){
  const cnt = $('input[value='+ prodNo +']').siblings('.count-wrapper').find('.count').text();
  // prodNo를 가진 input의 형제 중 count wrapper 찾아서 그 자손의 count를 찾아 text(값)을 가져와 cnt에 넣어준다.

  const changed_cnt = parseInt(cnt) + var_cnt;
  // cnt는 문자열이기 때문에 int로 변환 시켜 var_cnt를 계산 함.

  $.ajax({
      method: 'POST',
      url: '/cookTeacher/cart/cnt',
      traditional : true,     // 데이터 넘어가게 해주기
      data : {
          prodNo,
          cnt: changed_cnt // 넘겨줄 데이터
      },
      success: function(result){    // 성공하면 실행할 함수
          location.reload();
      }
  })
  
}
