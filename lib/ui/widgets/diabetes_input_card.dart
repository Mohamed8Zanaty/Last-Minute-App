import 'package:flutter/material.dart';

// --- Color Palette from your image ---
const Color kPrimaryPurple = Color(0xFF6A1B9A); // Deep purple for buttons/accents
const Color kLightPurpleBg = Color(0xFFF3E5F5); // Very light purple for card background
const Color kMutedPurpleText = Color(0xFF8E24AA); // Muted purple for labels and icons
const Color kDarkerPurple = Color(0xFF4A148C); // Darker purple for titles
const Color kHighlightPurple = Color(0xFFAB47BC); // A brighter purple for highlights

class DiabetesInputCard extends StatefulWidget {
  // Controllers for all the input fields
  final TextEditingController ageController;
  final TextEditingController genderController;
  final TextEditingController bmiController;
  final TextEditingController systolicBpController;
  final TextEditingController diastolicBpController;
  final TextEditingController glucoseController;
  final TextEditingController insulinController;
  final TextEditingController triglyceridesController;
  final TextEditingController hscrpController;
  final TextEditingController totalCholesterolController;
  final TextEditingController hdlCholesterolController;
  final TextEditingController smokingController;
  final TextEditingController activityController;

  // Callback functions and state
  final VoidCallback onAnalyze;
  final bool isLoading;

  const DiabetesInputCard({
    super.key,
    required this.ageController,
    required this.genderController,
    required this.bmiController,
    required this.systolicBpController,
    required this.diastolicBpController,
    required this.glucoseController,
    required this.insulinController,
    required this.triglyceridesController,
    required this.hscrpController,
    required this.totalCholesterolController,
    required this.hdlCholesterolController,
    required this.smokingController,
    required this.activityController,
    required this.onAnalyze,
    required this.isLoading,
  });

  @override
  State<DiabetesInputCard> createState() => _DiabetesInputCardState();
}

class _DiabetesInputCardState extends State<DiabetesInputCard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _numPages = 4;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // --- Main Build Method ---
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildStepIndicator(),
            const SizedBox(height: 20),
            SizedBox(
              height: 280, // Fixed height for the form pages
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  _buildStep1_BasicInfo(),
                  _buildStep2_Vitals(),
                  _buildStep3_LabResults(),
                  _buildStep4_Lifestyle(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildNavigationButtons(),
          ],
        ),
      ),
    );
  }
  
  // --- UI Helper Widgets ---

  Widget _buildHeader() {
    return const Text(
      'Your Health Snapshot',
      style: TextStyle(
        color: kDarkerPurple,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(_numPages, (int index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 10,
          width: _currentPage == index ? 30 : 10,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: _currentPage == index ? kPrimaryPurple : Colors.grey.shade300,
          ),
        );
      }),
    );
  }

  // --- Form Step Pages ---

  Widget _buildStep1_BasicInfo() {
    return _buildFormPage(
      title: "About You",
      children: [
        _buildTextField(
          controller: widget.ageController,
          label: 'Age',
          hint: 'e.g., 54',
          icon: Icons.cake_outlined,
        ),
        _buildTextField(
          controller: widget.genderController,
          label: 'Gender',
          hint: '1 for Male, 2 for Female',
          icon: Icons.person_outline,
          helperText: 'Enter 1 for Male, 2 for Female',
        ),
      ],
    );
  }

  Widget _buildStep2_Vitals() {
    return _buildFormPage(
      title: "Your Vitals",
      children: [
        _buildTextField(
          controller: widget.bmiController,
          label: 'Body Mass Index (BMI)',
          hint: 'e.g., 28.5',
          icon: Icons.accessibility_new_outlined,
        ),
        _buildTextField(
          controller: widget.systolicBpController,
          label: 'Systolic Blood Pressure',
          hint: 'e.g., 120 (the top number)',
          icon: Icons.favorite_border,
        ),
        _buildTextField(
          controller: widget.diastolicBpController,
          label: 'Diastolic Blood Pressure',
          hint: 'e.g., 80 (the bottom number)',
          icon: Icons.favorite,
        ),
      ],
    );
  }
  
  Widget _buildStep3_LabResults() {
    return _buildFormPage(
      title: "Recent Lab Results",
      children: [
         _buildTextField(
          controller: widget.glucoseController,
          label: 'Fasting Glucose (mg/dL)',
          hint: 'e.g., 95',
          icon: Icons.bloodtype_outlined,
        ),
         _buildTextField(
          controller: widget.insulinController,
          label: 'Insulin (muU/mL)',
          hint: 'e.g., 10.2',
          icon: Icons.opacity,
        ),
        // Add more fields here if needed
      ],
    );
  }

  Widget _buildStep4_Lifestyle() {
     return _buildFormPage(
      title: "Lifestyle Factors",
      children: [
         _buildTextField(
          controller: widget.smokingController,
          label: 'Smoking Status',
          hint: '1 for Yes, 2 for No',
          icon: Icons.smoking_rooms_outlined,
          helperText: 'Have you smoked at least 100 cigarettes in your life?',
        ),
         _buildTextField(
          controller: widget.activityController,
          label: 'Physical Activity',
          hint: '1 for Active, 2 for Inactive',
          icon: Icons.directions_run_outlined,
          helperText: 'Vigorous activity? (1=Yes, 2=No)',
        ),
      ],
    );
  }

  // --- Reusable Components for Form Building ---

  Widget _buildFormPage({required String title, required List<Widget> children}) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: kHighlightPurple,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    String? helperText,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: kMutedPurpleText),
          labelText: label,
          hintText: hint,
          helperText: helperText,
          labelStyle: const TextStyle(color: kPrimaryPurple),
          filled: true,
          fillColor: kLightPurpleBg,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: kPrimaryPurple, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // --- Back Button ---
        Opacity(
          opacity: _currentPage == 0 ? 0.0 : 1.0, // Hide if on the first page
          child: TextButton.icon(
            onPressed: () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            },
            icon: const Icon(Icons.arrow_back, color: kMutedPurpleText),
            label: const Text('Back', style: TextStyle(color: kMutedPurpleText)),
          ),
        ),
        // --- Next / Analyze Button ---
        ElevatedButton(
          onPressed: widget.isLoading
              ? null
              : () {
                  if (_currentPage == _numPages - 1) {
                    // Last page, run analysis
                    widget.onAnalyze();
                  } else {
                    // Go to next page
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: widget.isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                )
              : Text(
                  _currentPage == _numPages - 1 ? 'Analyze Risk' : 'Next',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
        ),
      ],
    );
  }
}
