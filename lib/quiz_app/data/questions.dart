import '../model/option.dart';
import '../model/question.dart';

final questions = <Question>[
  Question(
    text: 'สิ่งแรกที่ควรทำก่อนการฉีดยา คือ?', // Answer: ล้างมือ สวมถุงมือ
    questionImage: "assets/game_assets/question_images/1/1.png",
    options: [
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/1/1-1.png",
      ),
      const Option(
        isCorrect: true,
        optionImage: "assets/game_assets/question_images/1/1-2r.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/1/1-3.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/1/1-4.png",
      ),
    ],
  ),
  Question(
    text:
        'หลังจากล้างมือและสวมถุงมือ ให้เช็ดจุกยางด้วย?', // Answer: เช็ดจุกยางด้วยสำลีแอลกอฮอล์ 70%
    questionImage: "assets/game_assets/question_images/2/2.png",
    options: [
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/2/2-1.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/2/2-2.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/2/2-3.png",
      ),
      const Option(
        isCorrect: true,
        optionImage: "assets/game_assets/question_images/2/2-4r.png",
      ),
    ],
  ),
  Question(
    text: 'ขั้นตอนถัดไปคือ ฉีด?', // Answer: ฉีด NSS 0.9% 3ml
    questionImage: "assets/game_assets/question_images/3/3.png",
    options: [
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/3/3-1.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/3/3-2.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/3/3-3.png",
      ),
      const Option(
        isCorrect: true,
        optionImage: "assets/game_assets/question_images/3/3-4r.png",
      ),
    ],
  ),
  Question(
    text: 'หลังจากที่ฉีด NSS 0.9% ควรทำอะไร?', // Answer: ให้ฉีดยา
    questionImage: "assets/game_assets/question_images/4/4.png",
    options: [
      const Option(
        isCorrect: true,
        optionImage: "assets/game_assets/question_images/4/4-1r.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/4/4-2.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/4/4-3.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/4/4-4.png",
      ),
    ],
  ),
  Question(
    text: 'เมื่อฉีดยาเสร็จแล้ว ควรทำอะไรต่อไป?', // Answer: ฉีด NSS 0.9% 3ml.
    questionImage: "assets/game_assets/question_images/5/5.png",
    options: [
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/5/5-1.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/5/5-2.png",
      ),
      const Option(
        isCorrect: true,
        optionImage: "assets/game_assets/question_images/5/5-3r.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/5/5-4.png",
      ),
    ],
  ),
  Question(
    text:
        'สิ่งที่ควรทำทันทีหลังจากฉีด NSS?', // Answer: ทิ้งกระบอกฉีดยา สำลี ถุงมือใช้แล้ว ลงถังขยะติดเชื้อ
    questionImage: "assets/game_assets/question_images/6/6.png",
    options: [
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/6/6-1.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/6/6-2.png",
      ),
      const Option(
        isCorrect: true,
        optionImage: "assets/game_assets/question_images/6/6-3r.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/6/6-4.png",
      ),
    ],
  ),
  Question(
    text:
        'หลังจากทิ้งขยะแล้ว ควรเช็ดจุกยางด้วย?', // Answer: เช็ดจุกยางด้วยสำลีแอลกอฮอล์ 70%
    questionImage: "assets/game_assets/question_images/7/7.png",
    options: [
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/7/7-1.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/7/7-2.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/7/7-3.png",
      ),
      const Option(
        isCorrect: true,
        optionImage: "assets/game_assets/question_images/7/7-4r.png",
      ),
    ],
  ),
  Question(
    text: 'หลังจากเช็ดจุกยาง ควร?', // Answer: ล้างมือ
    questionImage: "assets/game_assets/question_images/8/8.png",
    options: [
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/8/8-1.png",
      ),
      const Option(
        isCorrect: true,
        optionImage: "assets/game_assets/question_images/8/8-2r.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/8/8-3.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/8/8-4.png",
      ),
    ],
  ),
  Question(
    text: 'ล้างมือแล้ว ควรทำอะไรต่อไป?', // Answer: เขียนใบบันทึกการให้ยา
    questionImage: "assets/game_assets/question_images/9/9.png",
    options: [
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/9/9-1.png",
      ),
      const Option(
        isCorrect: true,
        optionImage: "assets/game_assets/question_images/9/9-2r.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/9/9-3.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/9/9-4.png",
      ),
    ],
  ),
  Question(
    text: 'ให้ประเมินผู้ป่วยโดย?', // Answer: ประเมินผู้ป่วยหลังการฉีดยา
    questionImage: "assets/game_assets/question_images/10/10.png",
    options: [
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/10/10-1.png",
      ),
      const Option(
        isCorrect: true,
        optionImage: "assets/game_assets/question_images/10/10-2r.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/10/10-3.png",
      ),
      const Option(
        isCorrect: false,
        optionImage: "assets/game_assets/question_images/10/10-4.png",
      ),
    ],
  ),
];
