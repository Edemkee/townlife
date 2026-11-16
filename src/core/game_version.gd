class_name GameVersion
extends RefCounted
## Single place to read the game's version.
##
## The version lives in two files that must agree: the VERSION file in the
## repository root (read by the release tagging workflow) and
## application/config/version in project.godot (available in exported builds).

const SETTING := "application/config/version"


static func current() -> String:
	return str(ProjectSettings.get_setting(SETTING, "0.0.0"))


static func is_valid(version: String) -> bool:
	var parts := version.split(".")
	if parts.size() != 3:
		return false
	for part in parts:
		if not part.is_valid_int() or part.begins_with("-") or part.begins_with("+"):
			return false
	return true
