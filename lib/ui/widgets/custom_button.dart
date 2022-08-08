part of '../../main.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.route,
    required this.namaButton,
  }) : super(key: key);
  final String route;
  final String namaButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (route != '') {
          context.goNamed(route);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: colorStyles.blue40, borderRadius: BorderRadius.circular(30)),
        width: 80.w,
        height: 6.h,
        child: Center(
            child: Text(
          namaButton,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        )),
      ),
    );
  }
}
