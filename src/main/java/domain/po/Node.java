package domain.po;

public class Node {

    private String id;

    private String parentid;

    private String preNodeId;

    private String nextNodeId;

    private boolean isroot;

    private String topic;

    private boolean isreadonly;

    private boolean isadded;

    private boolean ismodified;

    private boolean isdeleted;

    private String direction;

    public Node() {}

    public Node(String id, String parentid, String preNodeId, String nextNodeId,
                boolean isroot, String topic, boolean isreadonly, boolean isadded,
                boolean ismodified, boolean isdeleted, String direction) {
        this.id = id;
        this.parentid = parentid;
        this.preNodeId = preNodeId;
        this.nextNodeId = nextNodeId;
        this.isroot = isroot;
        this.topic = topic;
        this.isreadonly = isreadonly;
        this.isadded = isadded;
        this.ismodified = ismodified;
        this.isdeleted = isdeleted;
        this.direction = direction;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getParentid() {
        return parentid;
    }

    public void setParentid(String parentid) {
        this.parentid = parentid;
    }

    public String getPreNodeId() {
        return preNodeId;
    }

    public void setPreNodeId(String preNodeId) {
        this.preNodeId = preNodeId;
    }

    public String getNextNodeId() {
        return nextNodeId;
    }

    public void setNextNodeId(String nextNodeId) {
        this.nextNodeId = nextNodeId;
    }

    public boolean isIsroot() {
        return isroot;
    }

    public void setIsroot(boolean isroot) {
        this.isroot = isroot;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public boolean isIsreadonly() {
        return isreadonly;
    }

    public void setIsreadonly(boolean isreadonly) {
        this.isreadonly = isreadonly;
    }

    public boolean isIsadded() {
        return isadded;
    }

    public void setIsadded(boolean isadded) {
        this.isadded = isadded;
    }

    public boolean isIsmodified() {
        return ismodified;
    }

    public void setIsmodified(boolean ismodified) {
        this.ismodified = ismodified;
    }

    public boolean isIsdeleted() {
        return isdeleted;
    }

    public void setIsdeleted(boolean isdeleted) {
        this.isdeleted = isdeleted;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }
}
