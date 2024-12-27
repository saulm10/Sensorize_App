import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/extensions/build_context_ex.dart';
import 'package:sensorize/services/services.dart';

@Singleton(as: DialogService)
class DialogServiceImpl implements DialogService {
  final NavigatorService _navigatorService;

  DialogServiceImpl(this._navigatorService);

  @override
  Future<bool> boolDialog(
      String title, String body, String okText, String noOkText) async {
    return await showDialog(
      context: _navigatorService.getCurrentContext(),
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
        ),
        content: Text(
          body,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.theme.colorScheme.primary,
                    minimumSize: const Size(40, 50),
                  ),
                  onPressed: () {
                    _navigatorService.goBack(resultado: true);
                  },
                  child: FittedBox(
                    child: Text(
                      okText,
                      style: TextStyle(
                        fontSize: 20,
                        color: context.theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    minimumSize: const Size(40, 50),
                  ),
                  onPressed: () {
                    _navigatorService.goBack(resultado: false);
                  },
                  child: FittedBox(
                    child: Text(
                      noOkText,
                      style: TextStyle(
                        fontSize: 20,
                        color: context.theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Future<String> stringDialog(String title, String body, String hintText,
      String okText, String noOkText) async {
    String result = '';
    return await showDialog(
      context: _navigatorService.getCurrentContext(),
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: SizedBox(
          height: 100,
          child: Column(
            children: [
              Text(body),
              TextField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintStyle: const TextStyle(color: Colors.grey),
                  hintText: hintText,
                ),
                onChanged: (value) => result = value,
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: context.theme.colorScheme.primary,
              minimumSize: const Size(40, 55),
            ),
            onPressed: () {
              _navigatorService.goBack(resultado: result);
            },
            child: Text(
              okText,
              style: TextStyle(
                fontSize: 20,
                color: context.theme.colorScheme.onPrimary,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              minimumSize: const Size(40, 55),
            ),
            onPressed: () {
              _navigatorService.goBack(resultado: result);
            },
            child: Text(
              noOkText,
              style: TextStyle(
                fontSize: 20,
                color: context.theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Future<String?> colorDialog() async {
    return await showDialog(
      context: _navigatorService.getCurrentContext(),
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text(
          'Selecciona un color',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        content: SizedBox(
          width: double.maxFinite,
          height: 200,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            shrinkWrap: true,
            children: [
              _colorTile(context, const Color(0xFFFFCC00)),
              _colorTile(context, const Color(0xFFC19A6B)),
              _colorTile(context, const Color(0xFF90B060)),
              _colorTile(context, const Color(0xFFD3D3D3)),
              _colorTile(context, const Color(0xFFFFA04C)),
              _colorTile(context, const Color(0xFF79553A)),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              minimumSize: const Size(40, 50),
            ),
            onPressed: () {
              _navigatorService.goBack();
            },
            child: FittedBox(
              child: Text(
                'Cancelar',
                style: TextStyle(
                  fontSize: 20,
                  color: context.theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _colorTile(
    BuildContext context,
    Color color,
  ) {
    return GestureDetector(
      onTap: () => _navigatorService.goBack(
          resultado: '${color.red},${color.green},${color.blue}'),
      child: Container(
        margin: const EdgeInsets.all(2),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
