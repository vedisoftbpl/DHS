package com.vedisoft.danishhousing.pojos;

public class Projects {
	
	private int projectId;
	private String projectName;
	private String bungProject;
	public Projects() {
		super();
	}
	public Projects(String projectName, String bungProject) {
		super();
		this.projectName = projectName;
		this.bungProject = bungProject;
	}
	public Projects(int projectId, String projectName, String bungProject) {
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
	public String getBungProject() {
		return bungProject;
	}
	public void setBungProject(String bungProject) {
		this.bungProject = bungProject;
	}
	@Override
	public String toString() {
		return "Projects [projectId=" + projectId + ", projectName=" + projectName + ", bungProject=" + bungProject
				+ "]";
	}
	
	

}
