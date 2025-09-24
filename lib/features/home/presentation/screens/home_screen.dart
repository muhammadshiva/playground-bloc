import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_bloc/features/home/presentation/bloc/home_bloc.dart';
import 'package:playground_bloc/features/home/presentation/bloc/home_state.dart';
import 'package:playground_bloc/features/todo/presentation/screens/todo_list_screen.dart';
// import 'package:playground_bloc/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:playground_bloc/features/reimbursement/presentation/screens/reimbursement_screen.dart';
import 'package:playground_bloc/features/reimbursement/presentation/bloc/reimbursement_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF0C4886), Color(0xFF157FEC)],
            ),
          ),
        ),
        title: const Text(
          'Home',
          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.when(
            initial: () => _buildHomeContent(context),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (items) => _buildHomeContent(context),
            error: (message) => Center(child: Text(message)),
            success: (message) => _buildHomeContent(context),
          );
        },
      ),
    );
  }

  Widget _buildHomeContent(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFE3F2FD), Color(0xFFF5F5F5)],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Welcome to Playground Bloc',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1976D2),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choose a feature to explore',
                style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                  children: [
                    _buildFeatureCard(
                      context,
                      title: 'Todo List',
                      description: 'Manage your tasks and stay organized',
                      icon: Icons.task_alt,
                      color: const Color(0xFF4CAF50),
                      onTap: () => _navigateToTodo(context),
                    ),
                    _buildFeatureCard(
                      context,
                      title: 'Reimbursement',
                      description: 'Track your expenses and claims',
                      icon: Icons.receipt_long,
                      color: const Color(0xFF2196F3),
                      onTap: () => _navigateToReimbursement(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
                child: Icon(icon, size: 32, color: color),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToTodo(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TodoListScreen()));
  }

  void _navigateToReimbursement(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: context.read<ReimbursementBloc>(),
          child: const ReimbursementScreen(),
        ),
      ),
    );
  }
}
