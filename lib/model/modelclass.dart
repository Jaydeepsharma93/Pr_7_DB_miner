class Quote {

  String? quote, author, type,id;

  Quote({this.id, this.author, this.quote, this.type});

  factory Quote.fromJson(Map json) {
    return Quote(
      id: json['id'],
      author: json['author'],
      quote: json['quote'],
      type: json['type'],
    );
  }
}
