from ward import test

from links_to_hugo_post.workflow import workflow_steps


@test("Should verify steps defined in workflow")
def test_verify_workflow_steps() -> None:
    assert len(workflow_steps()) == 1
