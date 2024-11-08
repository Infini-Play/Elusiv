import 'package:elusiv/features/configuration/presentation/widgets/themed_dropdown.dart';
import 'package:elusiv/features/configuration/presentation/widgets/themed_settings_text_field.dart';
import 'package:elusiv/features/configuration/presentation/widgets/themed_toggle.dart';
import 'package:flutter/material.dart';
import 'package:elusiv/core/theme/app_theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _controller = TextEditingController();

  String _initialUsernameValue = 'MyUsername';
  String _usernameValue = 'MyUsername';
  bool _initialToggleValue = true;
  bool _toggleValue = true;
  String _initialDropdownValue = 'Light';
  String _selectedDropdownValue = 'Light';

  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _controller.text = _usernameValue;
    _controller.addListener(_checkForChanges);
  }

  @override
  void dispose() {
    _controller.removeListener(_checkForChanges);
    _controller.dispose();
    super.dispose();
  }

  void _checkForChanges() {
    bool hasChanges = _controller.text != _initialUsernameValue ||
        _toggleValue != _initialToggleValue ||
        _selectedDropdownValue != _initialDropdownValue;

    if (hasChanges != _hasChanges) {
      setState(() {
        _hasChanges = hasChanges;
      });
    }
  }

  void _saveChanges() {
    setState(() {
      // Save the changes and reset the initial values
      _initialUsernameValue = _controller.text;
      _usernameValue = _controller.text;
      _initialToggleValue = _toggleValue;
      _initialDropdownValue = _selectedDropdownValue;
      _hasChanges = false; // Reset change detection
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ThemedSettingsTextField(
              controller: _controller,
              labelText: 'Change Username',
              hintText: "Type New Username",
              onChanged: (text) {
                _usernameValue = text;
                _checkForChanges();
              },
            ),
          ),
          ThemedToggle(
            label: 'Enable Notifications',
            value: _toggleValue,
            onChanged: (bool newValue) {
              setState(() {
                _toggleValue = newValue;
              });
              _checkForChanges();
            },
          ),
          ThemedDropdown(
            label: 'Theme',
            items: const ['Light', 'Dark', 'System Default'],
            selectedItem: _selectedDropdownValue,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedDropdownValue = newValue;
                });
                _checkForChanges();
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _hasChanges ? _saveChanges : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _hasChanges ? primary : secondary,
              ),
              child: const Text('Save Changes'),
            ),
          ),
        ],
      ),
    );
  }
}