Map<String, Map<String, double>> sizes = {
  "status_bar": {
    "width": double.infinity,
    "height": 16.0
  },
  "status-bar-bottom-divider": {
    "width": double.infinity,
    "height": 2.0
  }
};

double getSizeOf(String widget, String dim) {
  if(sizes.containsKey(widget)) {
    return sizes[widget]?[dim] ?? 0.0;
  } else {
    return 0;
  }
}