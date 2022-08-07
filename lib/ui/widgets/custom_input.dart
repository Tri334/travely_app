part of '../../main.dart';

class CustomInputLogin extends StatelessWidget {
  const CustomInputLogin({
    Key? key,
    required TextEditingController textEditingController,
    required this.hint,
  })  : _controller = textEditingController,
        super(key: key);

  final TextEditingController _controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12.sp),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorStyles.grey50),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorStyles.black70, width: 2),
              borderRadius: BorderRadius.circular(12)),
          hintText: hint),
    );
  }
}
