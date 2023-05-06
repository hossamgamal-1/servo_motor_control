import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/app_injection.dart';
import 'app_cubit/app_cubit.dart';
import 'team_page.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Servo Motor App'), centerTitle: true),
      body: BlocProvider(
        create: (context) => sL<AppCubit>(),
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: DefaultTextStyle(
                style: const TextStyle(fontSize: 20, color: Colors.black),
                child: ListView(
                  children: [
                    const Text('Enter IP Address'),
                    const SizedBox(height: 10),
                    TextField(
                      decoration:
                          const InputDecoration(hintText: 'EX: 192.168.1.135'),
                      onChanged: sL<AppCubit>().updateLocalBaseUrlValue,
                    ),
                    const CustomSlider(),
                    const SizedBox(height: 10),
                    const Text('Enter Angle manually:'),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: const InputDecoration(hintText: '90°'),
                      onChanged: sL<AppCubit>().updateLocalServoAngleFromField,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      onPressed: () async =>
                          await sL<AppCubit>().updateRemoteServoAngle(),
                      child: const Text('Set Angle'),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const TeamPage();
                      })),
                      child: const Text('Team Page'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var read = context.read<AppCubit>();
        return Column(
          children: [
            Slider(
              min: 0,
              max: 180,
              divisions: 180,
              onChanged: sL<AppCubit>().updateLocalServoAngle,
              value: read.angle.toDouble(),
            ),
            Text('Angle = ${read.angle.toString()}')
          ],
        );
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.child});
  final void Function()? onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
