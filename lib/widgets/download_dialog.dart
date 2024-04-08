import 'package:flutter/material.dart';

class DownloadDialog extends StatefulWidget {
  const DownloadDialog({super.key});

  @override
  State<DownloadDialog> createState() => _DownloadDialogState();
}

class _DownloadDialogState extends State<DownloadDialog> {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Descarga'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: const Text('Video MP4'),
            leading: Radio<int>(
              value: 1,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(
                  () {
                    selectedOption = value!;
                  },
                );
              },
            ),
          ),
          ListTile(
            title: const Text('Audio MP3'),
            leading: Radio<int>(
              value: 2,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(
                  () {
                    selectedOption = value!;
                  },
                );
              },
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: const Text('Descargar'),
        ),
      ],
    );
  }
}
