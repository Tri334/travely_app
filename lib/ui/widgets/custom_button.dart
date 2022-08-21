part of '../../main.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.namaButton,
    this.enable = true,
  }) : super(key: key);
  final String namaButton;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: enable ? colorStyles.blue40 : colorStyles.grey10,
          borderRadius: BorderRadius.circular(30)),
      width: 80.w,
      height: 6.h,
      child: Center(
          child: Text(
        namaButton,
        style: GoogleFonts.poppins(
          color: enable ? Colors.white : colorStyles.black10,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      )),
    );
  }
}
