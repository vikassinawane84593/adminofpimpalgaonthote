import 'package:flutter/material.dart';

class LightTimetableScreen extends StatefulWidget {
  const LightTimetableScreen({super.key});

  @override
  State<LightTimetableScreen> createState() => _LightTimetableScreenState();
}

class _LightTimetableScreenState extends State<LightTimetableScreen> {
  final List<_LightSchedule> _schedules = [
    _LightSchedule(
      day: 'Monday',
      startTime: '06:00 AM',
      endTime: '10:00 PM',
      isActive: true,
    ),
    _LightSchedule(
      day: 'Tuesday',
      startTime: '06:00 AM',
      endTime: '10:00 PM',
      isActive: true,
    ),
    _LightSchedule(
      day: 'Wednesday',
      startTime: '06:00 AM',
      endTime: '10:00 PM',
      isActive: true,
    ),
    _LightSchedule(
      day: 'Thursday',
      startTime: '06:00 AM',
      endTime: '10:00 PM',
      isActive: true,
    ),
    _LightSchedule(
      day: 'Friday',
      startTime: '06:00 AM',
      endTime: '10:00 PM',
      isActive: true,
    ),
    _LightSchedule(
      day: 'Saturday',
      startTime: '07:00 AM',
      endTime: '11:00 PM',
      isActive: true,
    ),
    _LightSchedule(
      day: 'Sunday',
      startTime: '07:00 AM',
      endTime: '11:00 PM',
      isActive: true,
    ),
  ];

  Future<void> _pickTime(int index, bool isStartTime) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime == null || !mounted) {
      return;
    }

    setState(() {
      final formattedTime = pickedTime.format(context);
      if (isStartTime) {
        _schedules[index].startTime = formattedTime;
      } else {
        _schedules[index].endTime = formattedTime;
      }
    });
  }

  void _saveTimetable() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Light timetable updated')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Light Timetable',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Update daily light availability timings.',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _saveTimetable,
                  icon: const Icon(Icons.save),
                  label: const Text('Save'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView.separated(
                itemCount: _schedules.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final schedule = _schedules[index];

                  return Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final isCompact = constraints.maxWidth < 560;

                        final timeControls = Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            _TimeButton(
                              icon: Icons.wb_sunny,
                              label: 'Start',
                              time: schedule.startTime,
                              onTap: () => _pickTime(index, true),
                            ),
                            _TimeButton(
                              icon: Icons.nightlight_round,
                              label: 'End',
                              time: schedule.endTime,
                              onTap: () => _pickTime(index, false),
                            ),
                          ],
                        );

                        final activeSwitch = Switch(
                          value: schedule.isActive,
                          activeThumbColor: const WidgetStatePropertyAll(
                            Color(0xFF2E7D32),
                          ),
                          onChanged: (value) {
                            setState(() {
                              schedule.isActive = value;
                            });
                          },
                        );

                        if (isCompact) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _DayHeader(schedule: schedule),
                              const SizedBox(height: 12),
                              timeControls,
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Active',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  activeSwitch,
                                ],
                              ),
                            ],
                          );
                        }

                        return Row(
                          children: [
                            Expanded(child: _DayHeader(schedule: schedule)),
                            timeControls,
                            const SizedBox(width: 12),
                            activeSwitch,
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF7FAF7),
    );
  }
}

class _DayHeader extends StatelessWidget {
  final _LightSchedule schedule;

  const _DayHeader({required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: schedule.isActive
              ? const Color(0xFFE5F3E6)
              : const Color(0xFFF1F1F1),
          child: Icon(
            schedule.isActive ? Icons.power : Icons.power_off,
            color: schedule.isActive ? const Color(0xFF2E7D32) : Colors.grey,
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                schedule.day,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                schedule.isActive ? 'Light available' : 'Light unavailable',
                style: TextStyle(
                  color: schedule.isActive ? Colors.green[700] : Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TimeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String time;
  final VoidCallback onTap;

  const _TimeButton({
    required this.icon,
    required this.label,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text('$label: $time'),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF2E7D32),
        side: const BorderSide(color: Color(0xFF9CCC9F)),
      ),
    );
  }
}

class _LightSchedule {
  final String day;
  String startTime;
  String endTime;
  bool isActive;

  _LightSchedule({
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.isActive,
  });
}
