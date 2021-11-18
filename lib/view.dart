import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/business_logic/Country_cubit.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'business_logic/business_cubit.dart';
import 'business_logic/entertainment.cubit.dart';
import 'business_logic/general_cubit.dart';
import 'business_logic/health_cubit.dart';
import 'business_logic/science_cubit.dart';
import 'business_logic/sports_cubit.dart';
import 'business_logic/technology_cubit.dart';

class NewsView extends StatefulWidget {
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  final List<Tab> newsTabs = <Tab>[
    new Tab(text: 'general'),
    new Tab(text: 'technology'),
    new Tab(text: 'business'),
    new Tab(text: 'entertainment'),
    new Tab(text: 'health'),
    new Tab(text: 'sports'),
    new Tab(text: 'science'),
  ];
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, initialIndex: 0, length: newsTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: ToggleSwitch(
            minWidth: 90.0,
            initialLabelIndex: 1,
            cornerRadius: 20.0,
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.white,
            labels: ['USA', 'Egypt'],
            activeBgColors: [Colors.blue, Colors.pink],
            onToggle: (index) {
              if (index == 0) {
                BlocProvider.of<CountryCubit>(context).getnews("us");
              } else {
                BlocProvider.of<CountryCubit>(context).getnews("eg");
              }

              print('switched to: $index');
            },
          ),
          bottom: TabBar(
            tabs: newsTabs,
            isScrollable: true,
            controller: _tabController,
          )),
      body: TabBarView(controller: _tabController, children: [
        General(),
        Technology(),
        Business(),
        Entertainment(),
        Health(),
        Sports(),
        Science()
      ]),
    );
  }
}

class General extends StatelessWidget {
  General() : super();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralCubit, List<dynamic>>(
      builder: (context, news) {
        if (news.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                title: news[index].title == null
                    ? Text("null")
                    : Text(news[index].title),
              ));
            });
      },
    );
  }
}

class Technology extends StatelessWidget {
  Technology() : super();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TechnologyCubit, List<dynamic>>(
      builder: (context, news) {
        if (news.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                title: news[index].title == null
                    ? Text("null")
                    : Text(news[index].title),
              ));
            });
      },
    );
  }
}

class Entertainment extends StatelessWidget {
  Entertainment() : super();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntertainmentCubit, List<dynamic>>(
      builder: (context, news) {
        if (news.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                title: news[index].title == null
                    ? Text("null")
                    : Text(news[index].title),
              ));
            });
      },
    );
  }
}

class Business extends StatelessWidget {
  Business() : super();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessCubit, List<dynamic>>(
      builder: (context, news) {
        if (news.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                title: news[index].title == null
                    ? Text("null")
                    : Text(news[index].title),
              ));
            });
      },
    );
  }
}

class Health extends StatelessWidget {
  Health() : super();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HealthCubit, List<dynamic>>(
      builder: (context, news) {
        if (news.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                title: news[index].title == null
                    ? Text("null")
                    : Text(news[index].title),
              ));
            });
      },
    );
  }
}

class Science extends StatelessWidget {
  Science() : super();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScienceCubit, List<dynamic>>(
      builder: (context, news) {
        if (news.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                title: news[index].title == null
                    ? Text("null")
                    : Text(news[index].title),
              ));
            });
      },
    );
  }
}

class Sports extends StatelessWidget {
  Sports() : super();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportsCubit, List<dynamic>>(
      builder: (context, news) {
        if (news.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                title: news[index].title == null
                    ? Text("null")
                    : Text(news[index].title),
              ));
            });
      },
    );
  }
}
