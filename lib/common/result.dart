class Result<T>{
  final String? msg;
  final int? code;
  final T? data;
  final bool? ok;
  Result(this.data,this.msg,this.code,this.ok);

  static Result<NT> Ok<NT>(NT data) {
    return Result(data,null,200,true);
  }
  static Result<NT> Err<NT>(String msg,[int code = 400]) {
    return Result(null,msg,code,false);
  }

}
