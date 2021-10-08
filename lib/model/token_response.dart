/// token_type : "Bearer"
/// expires_in : 3599
/// ext_expires_in : 3599
/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Imwzc1EtNTBjQ0g0eEJWWkxIVEd3blNSNzY4MCIsImtpZCI6Imwzc1EtNTBjQ0g0eEJWWkxIVEd3blNSNzY4MCJ9.eyJhdWQiOiJodHRwczovL29yZzExOWQ0NDQ3LmNybS5keW5hbWljcy5jb20iLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9kM2M3MmVjMS1iZDU0LTQwNWYtYTQ3ZC1mZGNjMTQ1YWIxYjUvIiwiaWF0IjoxNjMzNzIwNzE5LCJuYmYiOjE2MzM3MjA3MTksImV4cCI6MTYzMzcyNDYxOSwiYWlvIjoiRTJaZ1lERDQ5a0QyaWs5NXd1MTlpMDF6LzEzWkJ3QT0iLCJhcHBpZCI6IjdiMGE0M2ZjLWQ4MjItNDc2NS1iYzU5LTE1YTJhYWU0YTQzYSIsImFwcGlkYWNyIjoiMSIsImlkcCI6Imh0dHBzOi8vc3RzLndpbmRvd3MubmV0L2QzYzcyZWMxLWJkNTQtNDA1Zi1hNDdkLWZkY2MxNDVhYjFiNS8iLCJvaWQiOiI4ZDIxZGZhZi01OTIzLTQ5YjMtYWMzNy1iNGQ0ZmNlNTlhMmUiLCJyaCI6IjAuQVF3QXdTN0gwMVM5WDBDa2ZmM01GRnF4dGZ4RENuc2kyR1ZIdkZrVm9xcmtwRG9NQUFBLiIsInN1YiI6IjhkMjFkZmFmLTU5MjMtNDliMy1hYzM3LWI0ZDRmY2U1OWEyZSIsInRpZCI6ImQzYzcyZWMxLWJkNTQtNDA1Zi1hNDdkLWZkY2MxNDVhYjFiNSIsInV0aSI6InFULUZLdVgtTVVxa2RPcWYtQkNKQUEiLCJ2ZXIiOiIxLjAifQ.Qd5rpZlVAs29-6kmMwh84CVRZyF15GJrAM7ja75f6Y9MDY-uMzZvbeXjusPvWEtBUDp2MmutFS2IXJ4FRnrrCGTKP_XnhCiY5c2yxRSkyh7hmZ6ZIQJcSwff2ycLxPcLUt4ksSxbB4OmhR9SK3SQ7DYHCA_xM7jZ0UsweS9xJbzldRQk5IJ1twG1qiRSqfEc-LDtJm_J3bqQH-IfbjWolt-DY2KlYkuxvj_cv5i_VMGV_Df2mq7H7Q0DokLGPfTfWoPkSZUdjIKSpYGs-cwtSTeGhUt5-XzdlnFxNE04yMPu6ujBcl3R7H8P8zzQNagAL_vWhfzkbviMyyAiyfYa3w"

class TokenResponse {
  TokenResponse({
      String? tokenType, 
      int? expiresIn, 
      int? extExpiresIn, 
      String? accessToken,}){
    _tokenType = tokenType;
    _expiresIn = expiresIn;
    _extExpiresIn = extExpiresIn;
    _accessToken = accessToken;
}

  TokenResponse.fromJson(dynamic json) {
    _tokenType = json['token_type'];
    _expiresIn = json['expires_in'];
    _extExpiresIn = json['ext_expires_in'];
    _accessToken = json['access_token'];
  }
  String? _tokenType;
  int? _expiresIn;
  int? _extExpiresIn;
  String? _accessToken;

  String? get tokenType => _tokenType;
  int? get expiresIn => _expiresIn;
  int? get extExpiresIn => _extExpiresIn;
  String? get accessToken => _accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token_type'] = _tokenType;
    map['expires_in'] = _expiresIn;
    map['ext_expires_in'] = _extExpiresIn;
    map['access_token'] = _accessToken;
    return map;
  }

}