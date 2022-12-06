class Result<T>{
  final String? msg;
  final String? code;
  final T? data;
  final bool? ok;
  Result(this.data,this.msg,this.code,this.ok);

  static Result<NT> Ok<NT>(NT data) {
    return Result(data,null,"Ok",true);
  }
  static Result<NT> Err<NT>(String msg,[String code = "UserError"]) {
    return Result(null,msg,code,false);
  }

}

abstract class R{
  static Result<NT> ok<NT>(NT data) {
    return Result(data,"","OK",true);
  }
  static Result<NT> err<NT>(String msg,[int code = 400]) {
    return Result(null,msg,"UserError",false);
  }
}