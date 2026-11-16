extends GdUnitTestSuite
## Guards the versioning contract: VERSION and project.godot must agree.


func _read_version_file() -> String:
	var file := FileAccess.open("res://VERSION", FileAccess.READ)
	assert_object(file).is_not_null()
	return file.get_as_text().strip_edges()


func test_version_file_is_semver() -> void:
	assert_bool(GameVersion.is_valid(_read_version_file())).is_true()


func test_project_version_matches_version_file() -> void:
	assert_str(GameVersion.current()).is_equal(_read_version_file())


func test_is_valid_rejects_malformed_versions() -> void:
	for bad: String in ["", "1", "1.2", "1.2.3.4", "v1.2.3", "1.a.3", "1.-2.3", "1..3"]:
		assert_bool(GameVersion.is_valid(bad)).override_failure_message("accepted '%s'" % bad).is_false()


func test_is_valid_accepts_semver() -> void:
	for good: String in ["0.1.0", "1.0.0", "0.10.12"]:
		assert_bool(GameVersion.is_valid(good)).override_failure_message("rejected '%s'" % good).is_true()
