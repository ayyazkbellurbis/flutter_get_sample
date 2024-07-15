import 'package:sample/app/data/values/env.dart';

class URLs {
  URLs._privateConstructor();

  //User APIs

  static const log_in = "auth/login";
  static const verify_otp = "PatientMobileApplication/loginpatientwithotp";
  static const logout = "LogoutPatientApp";
  static const refresh_token = "PatientMobileApplication/MobileRefreshToken";

  static const baseFileDownloadPath =
      "${Env.baseURL}Doctor/GetPrescriptionFile?filePath=";

  static const baseImageDownloadPath =
      "${Env.baseURL}Patient/GetPatientImageFile?filePath=";
}
