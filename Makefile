# --- Build ---

genb:
	@flutter pub run build_runner build --delete-conflicting-outputs

genw:
	@flutter pub run build_runner watch --delete-conflicting-outputs
