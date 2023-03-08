#
# METADATA
# title: Pipeline definition sanity checks
# description: >-
#   Currently there is just a check to confirm the input
#   appears to be a Pipeline definition. We may add additional
#   sanity checks in future.
#
package policy.pipeline.basic

import future.keywords.contains
import future.keywords.if

import data.lib

expected_kind := "Pipeline"

# (Not sure if we need this, but I'm using it to test the docs build.)

# Fixme: It doesn't fail if the kind key is entirely missing..

# METADATA
# title: Input data has unexpected kind
# description: >-
#   A sanity check to confirm the input data has the kind "Pipeline"
# custom:
#   short_name: unexpected_kind
#   failure_msg: Unexpected kind '%s'
#
deny contains result if {
	expected_kind != input.kind
	result := lib.result_helper(rego.metadata.chain(), [input.kind])
}
