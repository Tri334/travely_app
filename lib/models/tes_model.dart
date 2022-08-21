class GetSize {
  double size;

  GetSize({required this.size});

  setSize(double sizeSet) {
    size = sizeSet;
    return size.toString();
  }

  getInfo() {
    return size.toString();
  }
}
