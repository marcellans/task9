FROM registry.redhat.io/openshift-logging/fluentd-rhel8:v1.7.4-70
RUN BUILD_PKGS="make gcc-c++ libffi-devel \
                autoconf automake libtool m4 \
                redhat-rpm-config" && \
    yum install -y $BUILD_PKGS

ADD Gemfile Gemfile.lock ./
RUN bundle install

RUN BUILD_PKGS="make gcc-c++ libffi-devel \
                autoconf automake libtool m4 \
                redhat-rpm-config" && \
    yum remove -y $BUILD_PKGS && yum clean all
