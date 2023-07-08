import 'package:client/core/cubit/search_prefs_cubit.dart';
import 'package:client/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewOptions extends StatefulWidget {
  const ViewOptions({super.key});

  @override
  State<ViewOptions> createState() => ViewOptionsState();
}

class ViewOptionsState extends State<ViewOptions> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchPrefsCubit, SearchPrefsState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
              ),
            ),
            child: Row(
              children: [
                OptionButton(
                  selected:
                      (context.watch<SearchPrefsCubit>().state as SearchPrefsInitial).lookingFor == LookingFor.tutors,
                  text: "Tutors",
                  bgColor: Theme.of(context).colorScheme.secondary,
                  fgcolor: Theme.of(context).colorScheme.onSecondary,
                  onTap: (newSelect) => context.read<SearchPrefsCubit>().setLookingFor(LookingFor.tutors),
                ),
                OptionButton(
                  selected:
                      (context.watch<SearchPrefsCubit>().state as SearchPrefsInitial).lookingFor == LookingFor.students,
                  text: "Students",
                  bgColor: Theme.of(context).colorScheme.secondary,
                  fgcolor: Theme.of(context).colorScheme.onSecondary,
                  onTap: (newSelect) => context.read<SearchPrefsCubit>().setLookingFor(LookingFor.students),
                ),
                OptionButton(
                  selected:
                      (context.watch<SearchPrefsCubit>().state as SearchPrefsInitial).lookingFor == LookingFor.all,
                  text: "All",
                  bgColor: Theme.of(context).colorScheme.secondary,
                  fgcolor: Theme.of(context).colorScheme.onSecondary,
                  onTap: (newSelect) => context.read<SearchPrefsCubit>().setLookingFor(LookingFor.all),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class OptionButton extends StatefulWidget {
  const OptionButton({
    super.key,
    required this.selected,
    required this.text,
    required this.bgColor,
    required this.fgcolor,
    required this.onTap,
  });

  final String text;
  final bool selected;
  final Color bgColor;
  final Color fgcolor;
  final Function(bool newSelect) onTap;

  @override
  State<OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TouchableOpacity(
        onTap: () => widget.onTap(!widget.selected),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: widget.selected ? widget.bgColor : Colors.transparent,
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.selected ? widget.fgcolor : Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
