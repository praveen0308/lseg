class FAQModel {
  String? question;
  String? answer;

  FAQModel({this.question, this.answer});

  Map<String, dynamic> toMap() {
    return {
      'question': this.question,
      'answer': this.answer,
    };
  }

  factory FAQModel.fromMap(Map<String, dynamic> map) {
    return FAQModel(
      question: map['question'] as String,
      answer: map['answer'] as String,
    );
  }
}
