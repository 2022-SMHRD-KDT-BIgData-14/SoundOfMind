## SoundOfMind(마음의소리) 팀명 : 백문불여일견(百聞不如一見)
<div align=center><img src=https://user-images.githubusercontent.com/106305465/196345132-c194cb35-9167-412c-b9d9-5a16aacc3a5c.png></h1></div>

# 1. 프로젝트 개요
**주제 : 음성 인식을 활용한 대화자 감정분석 기반 청각장애인 커뮤니티 서비스**
- 대화자의 음성을 받아서 음성 파라미터를 추출하여 감정을 분석하는 서비스 제공
- 사용자의 의견을 올리고 댓글로 이야기를 나누는 자유게시판과 감정별로 뉴스를 조회할 수 있는 기능 제공
- 글쓴이를 클릭하면 메시지 보내기가 가능하며 이후 자유롭게 1:1 채팅 가능
# 2. 주요기능
![image](https://user-images.githubusercontent.com/106305465/196345516-219711c6-3497-472c-b006-07cdd93cd06a.png)
# 3. 개발환경
 구분|내용
---|---|
사용언어|Java,HTML/CSS,JavaScript,Python,Colab
사용 라이브러리| Bootstrap,Mybatis,Maven,Flask,JQuery,mysql,KoBERT,MLP(MFCC), etc
개발도구|SpringBoot,VisualStudioCode,Jupyter, etc
서버환경| tomcat 9.0, Flask, Flask-ngrok
데이터베이스|MySQL
# 4. 유스케이스
![유스케이스](https://user-images.githubusercontent.com/106305465/196311162-cf6f1b8e-9bf0-4c57-9ebe-1f07baae3d5a.png)
# 5. 서비스 아키텍처
![서비스아키텍처](https://user-images.githubusercontent.com/106305465/196311158-e3cc574b-3ba4-41d8-aa5d-3ffa9a137ce7.png)
# 6. ER 다이어그램
![ERD](https://user-images.githubusercontent.com/106305465/196311215-e3b57ec6-a813-41af-9ea8-8850fe7c7d88.png)
# 7. 모델 구현
![image](https://user-images.githubusercontent.com/106305465/196311355-1a403c3a-77ae-4dc4-a0c9-603af87062ec.png)

# 8. WEB 페이지
#### 메인페이지
![메인페이지](https://user-images.githubusercontent.com/106305465/196311026-26c89c9c-a470-42ee-9cbf-b9469047fbe4.jpg)
#### 커뮤니티
![커뮤니티](https://user-images.githubusercontent.com/106305465/196311083-d99a7ffa-d087-471e-b5d2-9d4ced0b3780.png)
#### 채팅/뉴스/피드백
![채팅뉴스피드백](https://user-images.githubusercontent.com/106305465/196311108-bb6df9bd-3345-4477-9643-42f081ace858.jpg)
#### 프로필/복지관/그룹채팅
![프로필복지관그룹채팅](https://user-images.githubusercontent.com/106305465/196311129-55402dac-d4f6-4ed7-a400-bddcb1ea2c76.png)
# 9. 모델개발 트러블 슈팅
#### 첫번째 시안
![image](https://user-images.githubusercontent.com/106305465/196341225-853b70aa-3c82-4270-84cb-e1a5f6cd74d7.png)
- 어조와 관련된 데이터는 CNN 모델을 사용했고,
내용과 관련된 데이터는 KoBERT 모델을 사용했습니다.
하지만 KoBERT 모델이 파이토치 기반으로 구성되어 CNN 모델과 결합할 방법을 찾지 못해 다른 방법을 찾게 되었습니다.
#### 두번째 시안
![image](https://user-images.githubusercontent.com/106305465/196341584-00fbed1e-f3e6-41bf-96c3-076855f6e960.png)
- 어조와 관련된 데이터는 첫 번째 방법과 동일하게 CNN 모델을
내용과 관련된 데이터는 BERT 모델을 사용했습니다.
KoBERT 모델과 다르게 BERT 모델은 CNN 모델과 결합해 하나의 통합모델 구현에 성공했으나, BERT 모델의 정확도가 낮게 나오는 다른 문제가 발생했습니다.
이를 극복하기 위해 텍스트 토큰화 과정 등 전체적으로 검증하는 여러 시도를 했으나 해결방안을 찾지 못해 통합모델에서 유의미한 결과를 얻어낼 수 없었습니다.
# 10. 팀원 단위 업무분장
![팀원소개](https://user-images.githubusercontent.com/106305465/196311138-91930393-9d67-4622-adfc-53db9816cbf8.jpg)


# 11. 시연영상
# 12. 참고문헌
