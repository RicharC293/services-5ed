class TicketModel {
	final int id;
	final String documentId;
	final String name;
	final String address;
	final DateTime date;
	final String comment;
	final DateTime createdAt;
	final DateTime updatedAt;
	final DateTime publishedAt;

	TicketModel({
		required this.id,
		required this.documentId,
		required this.name,
		required this.address,
		required this.date,
		required this.comment,
		required this.createdAt,
		required this.updatedAt,
		required this.publishedAt,
	});

	factory TicketModel.fromJson(Map<String, dynamic> json) {
		return TicketModel(
			id: json['id'],
			documentId: json['documentId'],
			name: json['name'],
			address: json['address'],
			date: DateTime.parse(json['date']),
			comment: json['comment'],
			createdAt: DateTime.parse(json['createdAt']),
			updatedAt: DateTime.parse(json['updatedAt']),
			publishedAt: DateTime.parse(json['publishedAt']),
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'id': id,
			'documentId': documentId,
			'name': name,
			'address': address,
			'date': date.toIso8601String(),
			'comment': comment,
			'createdAt': createdAt.toIso8601String(),
			'updatedAt': updatedAt.toIso8601String(),
			'publishedAt': publishedAt.toIso8601String(),
		};
	}
}