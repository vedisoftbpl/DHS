package com.vedisoft.danishhousing.pojos;

public class Projects {
	
	private int projectId;
	private String projectName;
	private char bungProject;
	public Projects() {
		super();
	}
	public Projects(String projectName, char bungProject) {
		super();
		this.projectName = projectName;
		this.bungProject = bungProject;
	}
	public Projects(int projectId, String projectName, char bungProject) {
		super();
		this.projectId = projectId;
		this.projectName = projectName;
		this.bungProject = bungProject;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public char getBungProject() {
		return bungProject;
	}
	public void setBungProject(char bungProject) {
		this.bungProject = bungProject;
	}
	@Override
	public String toString() {
		return "Projects [projectId=" + projectId + ", projectName=" + projectName + ", bungProject=" + bungProject
				+ "]";
	}
	
	

}
