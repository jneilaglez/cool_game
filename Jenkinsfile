pipeline {
    agent {
        docker {
            image 'cool_game_jenkins_slave'
        }
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    mkdir build
                    mkdir test/lib
                    git clone https://github.com/google/googletest.git test/lib/googletest
                '''
            }
        }
        stage("Build CMake"){
            steps{
                sh '''
                    cd build
                    cmake ..
                '''
            }
        }
        stage("Build and Compile"){
            steps {
                sh '''
                    cd build
                    make
                '''
            }
        }
        stage("Test"){
            steps {
                script {
                    try {
                        sh './build/test/cool_game_test'
                    } catch (exc) {
                        currentBuild.result = 'UNSTABLE'
                    }
                }
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'build/src/cool_game'
            archiveArtifacts artifacts: 'build/test/cool_game_test'
            sh '''
                echo "cleaning build directory"
                rm -rf build/ test/lib/
            '''
        }
        success {
            echo 'Cool Game was built successfully'
        }
        unstable {
            echo 'Cool Game was marked as unstable'
        }
        failure {
            echo 'Cool Game was marked as failure'
        }
    }
}