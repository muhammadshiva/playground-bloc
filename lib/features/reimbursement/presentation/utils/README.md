# Reimbursement Form Data Collection

This document explains how to use the form data collection functionality for the reimbursement feature.

## Overview

The `ReimbursementFormHelper` class provides utilities to collect, validate, and format form data from both the `ReimbursementFormScreen` and `ReimbursementBottomSheet` components.

## Features

### 1. Form Data Collection

- Collects all form data from the current state
- Returns a complete `Reimbursement` object ready for API submission
- Handles both create and update scenarios

### 2. Form Validation

- Validates all required fields
- Returns detailed error messages for missing fields
- Provides boolean validation status

### 3. API Payload Conversion

- Converts form data to a Map format suitable for API submission
- Handles date formatting and null values

## Usage Examples

### Basic Form Submission

```dart
// In your widget or bloc
void submitForm() {
  final state = context.read<ReimbursementBloc>().state;

  // Validate form
  if (!ReimbursementFormHelper.isFormValid(state)) {
    final errorMessage = ReimbursementFormHelper.getValidationErrorMessage(state);
    // Show error to user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage))
    );
    return;
  }

  // Collect form data
  final reimbursement = ReimbursementFormHelper.colmitFormData(state);

  if (reimbursement != null) {
    // Submit to API
    context.read<ReimbursementBloc>().add(const ReimbursementEvent.submitForm());
  }
}
```

### API Payload Generation

```dart
// Convert to API format
final reimbursement = ReimbursementFormHelper.collectFormData(state);
if (reimbursement != null) {
  final apiPayload = ReimbursementFormHelper.toApiPayload(reimbursement);

  // Send to API
  await apiService.submitReimbursement(apiPayload);
}
```

### Validation Check

```dart
// Check if form is valid
final isValid = ReimbursementFormHelper.isFormValid(state);

// Get missing fields
final missingFields = ReimbursementFormHelper.getMissingFields(state);
print('Missing fields: $missingFields'); // ['Tanggal', 'Nominal']

// Get formatted error message
final errorMessage = ReimbursementFormHelper.getValidationErrorMessage(state);
print(errorMessage); // "Mohon isi field: Tanggal, Nominal"
```

## Form Fields

The form collects the following data:

### From ReimbursementFormScreen:

- **Date** (`selectedDate`): DateTime - Required
- **Claim Type** (`selectedClaimType`): String - Required
- **Detail** (`detail`): String - Required

### From ReimbursementBottomSheet:

- **Nominal** (`nominal`): String - Required
- **Description** (`description`): String - Required
- **Image Path** (`imagePath`): String? - Optional

### Auto-generated:

- **ID**: String - Auto-generated timestamp
- **Status**: String - Defaults to 'pending'
- **Created At**: DateTime - Auto-generated
- **Updated At**: DateTime - Auto-generated

## Integration with Bloc

The form submission is handled through the `ReimbursementSubmitForm` event:

```dart
// Trigger form submission
context.read<ReimbursementBloc>().add(const ReimbursementEvent.submitForm());
```

The bloc will:

1. Validate the form using `ReimbursementFormHelper.isFormValid()`
2. Collect data using `ReimbursementFormHelper.collectFormData()`
3. Submit to the appropriate use case (create or update)
4. Emit success or error states

## Error Handling

The helper provides comprehensive error handling:

- **Validation Errors**: Clear messages about missing required fields
- **Data Collection Errors**: Handles null states and invalid data
- **API Format Errors**: Ensures proper data formatting for API submission

## Future API Integration

When the API is ready, you can easily integrate it by:

1. Using `ReimbursementFormHelper.toApiPayload()` to get the API format
2. Sending the payload to your API service
3. Handling the response in your use cases

Example:

```dart
// In your use case
final payload = ReimbursementFormHelper.toApiPayload(reimbursement);
final response = await apiService.createReimbursement(payload);
```
