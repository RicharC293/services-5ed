import 'package:flutter/material.dart';

class CreateServiceScreen extends StatefulWidget {
  const CreateServiceScreen({super.key});
  static const String routeName = '/create-service';

  @override
  State<CreateServiceScreen> createState() => _CreateServiceScreenState();
}

class _CreateServiceScreenState extends State<CreateServiceScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dateTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Agendar Servicio")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nombre y Apellido",
                  hintText: "Ingresa tu nombre y apellido",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu nombre y apellido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Dirección",
                  hintText: "Ingresa tu dirección",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu dirección';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _dateTimeController,
                decoration: InputDecoration(
                  labelText: "Fecha y Hora",
                  hintText: "Selecciona la fecha y hora",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor selecciona una fecha y hora';
                  }
                  return null;
                },
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now().add(const Duration(days: 1)),
                    firstDate: DateTime.now().add(const Duration(days: 1)),
                    lastDate: DateTime(2100),
                  ).then((date) {
                    if (date != null && context.mounted) {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((time) {
                        if (time != null) {
                          // Logic to handle selected date and time
                          final selectedDateTime = DateTime(
                            date.year,
                            date.month,
                            date.day,
                            time.hour,
                            time.minute,
                          );
                          _dateTimeController.text =
                              "${selectedDateTime.toLocal()}";
                        }
                      });
                    }
                  });
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Mensaje",
                  hintText: "Escribe un mensaje (opcional)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 24),
              const Text(
                "Al crear un servicio, aceptas nuestros términos y condiciones.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FilledButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              // Logic to handle form submission
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Servicio creado exitosamente')),
              );
              Navigator.pop(context); // Navigate back after creation
            }
          },
          child: const Text("Crear Servicio"),
        ),
      ),
    );
  }
}
