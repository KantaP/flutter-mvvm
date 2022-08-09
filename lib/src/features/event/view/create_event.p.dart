import 'package:flutter/material.dart';
import 'package:prototype/src/features/event/model/create_event.st.dart';
import 'package:prototype/src/features/event/view/di/create_event.vm.dart';
import 'package:prototype/src/view_model/view.abs.dart';
import 'package:prototype/src/widgets/loading.dart';

class CreateEventPage extends View<CreateEventViewModel> {
  const CreateEventPage({required CreateEventViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _CreateEventPageState createState() => _CreateEventPageState(viewModel);
}

class _CreateEventPageState
    extends ViewState<CreateEventPage, CreateEventViewModel> {
  _CreateEventPageState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CreateEventState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          final state = snapshot.data!;

          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  title: Text(
                    "Create Event",
                    style: Theme.of(context).textTheme.headlineSmall?.merge(
                          const TextStyle(color: Colors.white),
                        ),
                  ),
                ),
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 32.0, right: 32.0, top: kToolbarHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          decoration:
                              const InputDecoration(label: Text("Party name")),
                          onChanged: (value) {
                            viewModel
                                .updateState(<String, dynamic>{"name": value});
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                label: Text("Maximum Guest")),
                            onChanged: (value) {
                              viewModel.updateState(
                                  <String, dynamic>{"maximumGuest": value});
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child: ElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              viewModel.createEvent();
                            },
                            child: const Text('Confirm'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: state.isLoading,
                child: const Loading()
              ),
            ],
          );
        });
  }
}
