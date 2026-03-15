Map<String, Map<String, double>> sizes = {
  "status_bar": {
    "width": double.infinity,
    "height": 16.0
  },
  "status-bar-bottom-divider": {
    "width": double.infinity,
    "height": 2.0
  },
  "divider": {
    "width": 2.0
  },
  "desks-header": {
    "height": 96.0,
  },
  "desk-tab": {
    "height": 64.0,
    "width": 192.0
  },
  "space-between-buttons": {
    "height": 8.0
  },
  "button": {
    "height": 36.0,
    "width": double.infinity
  },
  "text-input": {
    "height": 36.0,
    "width": double.infinity
  },
};

double getSizeOf(String widget, String dim) {
  if(sizes.containsKey(widget)) {
    return sizes[widget]?[dim] ?? 0.0;
  } else {
    return 0;
  }
}