class BaseErrorMessage {
  String? error;

  BaseErrorMessage({this.error});

  BaseErrorMessage.fromJson(final Map<String, dynamic> json) {
    final failure = json['error'];
    error = (failure is int ? failure.toString() : failure);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;

    return data;
  }
}
