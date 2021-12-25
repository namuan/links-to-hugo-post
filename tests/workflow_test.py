from links_to_hugo_post.workflow import workflow_steps


def test_verify_workflow_steps() -> None:
    assert len(workflow_steps()) == 1
