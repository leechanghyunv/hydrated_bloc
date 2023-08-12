



import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hybrated_bloc_practice_230811/bloc_container/arrival_bloc/bloc_controller.dart';
import 'package:hybrated_bloc_practice_230811/bloc_container/counter_bloc/bloc_controller.dart';

import '../bloc_container/repository_bloc/bloc_controller.dart';
import 'layout_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutScreen(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterController,String>(
                builder: (context, state){
                return Text(state.toString());
            }),
            BlocBuilder<ArrivalController,ArrivalDataState>(
                builder: (context, state){
                  return state.when(
                      initial: () => Text('--'),
                      loading: () => Text('loading.....'),
                      loaded: (arrival)=>Text(arrival.toString()),
                      error: (msg) => Text(e.toString()),
                  );
                }),
            BlocBuilder<FilterContorller,DataFilterState>(
                builder: (context, state){
                  return state.when(
                    initial: () => Text('--'),
                    loading: () => Text('loading.....'),
                    loaded: (arrival)=>Text(arrival.toString()),
                    error: (msg) => Text(e.toString()),
                  );
                }),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(
            backgroundColor: Colors.grey[600],
            onPressed: (){
              context.read<CounterController>().add(CounterEvent.increment());
              context.read<FilterContorller>().add(DataFilterEvent.FiltedList('서울', '01호선'));
              // context.read<ArrivalController>().add(ArrivalDataEvent.ArrivalList('범계'));
          },child: Icon(Icons.add),
          ),

          FloatingActionButton.small(
            backgroundColor: Colors.grey[600],
            onPressed: (){
              context.read<CounterController>().add(CounterEvent.decrement());
          },child: Icon(Icons.remove),
          ),
          FloatingActionButton.small(
            backgroundColor: Colors.grey[600],
            onPressed: (){
              context.read<CounterController>().add(CounterEvent.decrement());
            },child: Icon(Icons.tram_sharp),
          ),
        ],
      ),
    );
  }
}
