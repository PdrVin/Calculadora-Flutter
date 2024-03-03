class Memory {
  static const operations = ['%', '/', '*', '-', '+', '='];

  String? _operation;
  bool _useOperation = false;

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;

  String result = '0';

  Memory() {
    _clean();
  }

  _clean() {
    result = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    _operation = null;
    _useOperation = false;
  }

  applyCommand(String command) {
    if (command == 'AC') {
      _clean();
    } else if (command == 'DEL') {
      deleteEndDigit(command);
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }
  }

  deleteEndDigit(String command) {
    result = result.length > 1 ? result.substring(0, result.length - 1) : '0';
  }

  _setOperation(String newOperation) {
    if (_useOperation && newOperation == _operation) return;

    if (_bufferIndex == 0) {
      _bufferIndex = 1;
    } else {
      _buffer[0] = _calculate();
    }

    if (newOperation != '=') _operation = newOperation;

    result = _buffer[0].toString();
    result = result.endsWith('.0') ? result.split('.')[0] : result;
    _useOperation = true;
  }
  
  _addDigit(String digit) {
    if (_useOperation) result = '0';

    if (result.contains('.') && digit == '.') digit = '';
    if (result == '0' && digit != '.') result = '';
    result += digit;

    _buffer[_bufferIndex] = double.tryParse(result) ?? 0;
    _useOperation = false;
  }

  double _calculate() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '*':
        return _buffer[0] * _buffer[1];
      default:
        return _buffer[0];
    }
  }
}
